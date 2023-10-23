import 'package:flutter/material.dart';
import 'package:notes_offline/database/database.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final database = NoteDatabase();

  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteContentController = TextEditingController();

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
                  if (_noteTitleController.text.isNotEmpty ||
                      _noteContentController.text.isNotEmpty) {
                    AlertDialog alert = AlertDialog(
                      title: const Text(
                        'Simpan Catatan?',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.all(8),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(
                                context,
                                true,
                              );
                              Navigator.pop(
                                context,
                                true,
                              );
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                          child: const Text(
                            'Batal',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() async {
                              database.insertNotes(
                                _noteTitleController.text,
                                _noteContentController.text,
                              );
                              Navigator.pop(context);
                              Navigator.pop(context);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text('Simpan'),
                        ),
                      ],
                    );
                    showDialog(context: context, builder: (context) => alert);
                    return;
                  } else {
                    Navigator.pop(
                      context,
                      true,
                    );
                  }
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
                      color: Colors.grey,
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
          await database.insertNotes(
            _noteTitleController.text,
            _noteContentController.text,
          );

          if (context.mounted) {
            Navigator.pop(
              context,
            );
          }
        },
        backgroundColor: Colors.grey.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.save,
          size: 38,
        ),
      ),
    );
  }
}
