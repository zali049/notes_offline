import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'database.g.dart';


class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 32)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
}

@DriftDatabase(tables: [Notes, Categories])
class NoteDatabase extends _$NoteDatabase {
  NoteDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Note>> getNotes() async {
    return await select(notes).get();
  }
  Future<Note>getNote(int id) async {
    return await (select(notes)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future updateNotes(Note note, String newTitle, String newContent) async {
    return await update(notes).replace(Note(id: note.id, title: newTitle, content: newContent ));
  }

  Future<int> insertNotes(String title, String content) async {
    return await into(notes).insert(NotesCompanion.insert(title: title, content: content));
  }

  Future<int> deleteNotes(int id) async {
    return await (delete(notes)..where((tbl) => tbl.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'dbsqlite'));
    return NativeDatabase(file);
  });
}
