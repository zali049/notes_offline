import 'package:flutter/material.dart';
import 'package:notes_offline/database/database.dart';

class EditContentScreen extends StatefulWidget {
  final Note note;

  const EditContentScreen({
    super.key,
    required this.note,
  });

  @override
  State<EditContentScreen> createState() => _EditContentScreenState();
}

class _EditContentScreenState extends State<EditContentScreen> {
  final database = NoteDatabase();

  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteContentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _noteTitleController.text = widget.note.title;
    _noteContentController.text = widget.note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade700,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(
                      context,
                      true,
                    );
                  });
                },
                padding: const EdgeInsets.all(0),
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800.withOpacity(.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                TextFormField(
                  controller: _noteTitleController,
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
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  maxLines: 1,
                  maxLength: 31,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                TextFormField(
                  controller: _noteContentController,
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
                    hintText: 'Mulai menulis...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_noteTitleController.text.isEmpty ||
              _noteContentController.text.isEmpty) {
            return;
          }
          final result = await database.updateNotes(
            widget.note,
            _noteTitleController.text,
            _noteContentController.text,
          );
          if (result) {
            if (context.mounted) {
              Navigator.pop(
                context,
                true,
              );
            }
          }
        },
        backgroundColor: Colors.grey.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.check,
          size: 38,
        ),
      ),
    );
  }
}
