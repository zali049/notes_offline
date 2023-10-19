import 'package:flutter/material.dart';
import 'package:notes_offline/database/database.dart';
import 'package:notes_offline/screens/edit_content_screen.dart';
import 'package:notes_offline/widget/app_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final database = NoteDatabase();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarCustom(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/content')
                .then((value) => setState(() {}));
          },
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder<List<Note>>(
          future: database.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditContentScreen(
                                  note: snapshot.data![index],
                                ),
                              ),
                            ).then((value) => setState(() {}));
                          });
                        },
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(snapshot.data![index].content),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              database.deleteNotes(snapshot.data![index].id);
                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("Tidak ada catatan"),
                    ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
