
import 'package:flutter/cupertino.dart';
import 'package:notes_offline/database/database.dart';

NoteDatabase data = NoteDatabase();

class NoteModels {
  final int id;
  final String title;
  final String content;
  final String category;
  final DateTime timeStamp;

  NoteModels({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.timeStamp,
  });
}
