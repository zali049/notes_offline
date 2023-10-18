// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_offline/database/database.dart';

class EditContentScreen extends StatefulWidget {
  final int? args;
  const EditContentScreen({super.key, required this.args});

  @override
  State<EditContentScreen> createState() => _EditContentScreenState();
}

class _EditContentScreenState extends State<EditContentScreen> {
  final database = NoteDatabase();
  Note? note;
  String title = "";
  String content = "";

  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteContentController = TextEditingController();
  String timeFormat = DateFormat('dd LLLL kk:mm').format(DateTime.now());



  @override
  void initState() {
    super.initState();
    _noteTitleController.text = note!.title;
    _noteContentController.text = note!.content;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("Notes"),
          centerTitle: true,
          backgroundColor: Colors.grey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(5),
            ),
          ),
          leading: InkWell(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context, database.insertNotes(_noteTitleController.text, _noteContentController.text));
                },
                icon: const Icon(Icons.save),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NoteTitle(_noteTitleController),
                SizedBox(
                  height: 20,
                  child: Text(timeFormat.toString()),
                ),
                NoteContent(_noteContentController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoteTitle extends StatelessWidget {
  final _noteFieldController;

  const NoteTitle(this._noteFieldController, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _noteFieldController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
        counter: null,
        counterText: "",
        hintText: 'Title',
        hintStyle: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
      ),
      maxLines: 1,
      maxLength: 31,
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        height: 1.5,
        color: Colors.black,
      ),
      textCapitalization: TextCapitalization.words,
    );
  }
}

class NoteContent extends StatelessWidget {
  final _noteFieldController;

  const NoteContent(this._noteFieldController, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _noteFieldController,
      maxLines: null,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
        counter: null,
        counterText: "",
        hintText: 'Mulai menulis',
        hintStyle: TextStyle(
          fontSize: 14,
          height: 1.5,
        ),
      ),
      style: const TextStyle(
        fontSize: 14,
        height: 1.5,
      ),
    );
  }
}
