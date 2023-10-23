import 'package:flutter/material.dart';
import 'package:notes_offline/database/database.dart';
import 'package:notes_offline/screens/edit_content_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final database = NoteDatabase();
  final TextEditingController searchController = TextEditingController();

  Future<List<Note>>? filteredNote;
  List<Note>? myData;
  List<Note>? unFiltered;

  Future<List<Note>> loadData() async {
    List<Note> data = await database.getNotes();
    setState(() {
      myData = data;
      unFiltered = myData;
    });
    return data;
  }


  onChangeSearch(String searchText) {
    var  searchExist = searchText.isNotEmpty ? true : false;
    if(searchExist) {
      var filterData = [];

      for(var i = 0; i < unFiltered!.length; i++){
        String word = unFiltered![i].title;
        if(word.contains(searchText)) {
          filterData.add(unFiltered);
        }
      }
      setState(() {
        myData = filterData.cast<Note>();
      });
    } else {
      myData = unFiltered;
    }
  }


  @override
  void initState() {
    super.initState();
    filteredNote = loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        backgroundColor: Colors.grey.shade800,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              focusColor: Colors.grey.shade500.withOpacity(.8),
              onTap: () {},
              highlightColor: Colors.grey.shade500.withOpacity(.8),
              borderRadius: BorderRadius.circular(10),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Icon(
                  Icons.sort,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: TextFormField(
                controller: searchController,
                onChanged: onChangeSearch,
                style: const TextStyle(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.only(top: 12, bottom: 12, right: 12),
                  hintText: "Search notes....",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey,
                  fillColor: Colors.grey.shade700,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/content')
              .then((value) => setState(() {}));
        },
        backgroundColor: Colors.grey.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
      backgroundColor: Colors.grey.shade700,
      body: FutureBuilder<List<Note>>(
        future: filteredNote,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (myData!.isNotEmpty) {
              return ListView.builder(
                itemCount: myData!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Colors.grey.shade800,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditContentScreen(
                                        note: myData![index],
                                      ),
                                ),
                              ).then((value) => setState(() {}));
                            });
                          },
                          title: RichText(
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: '${myData![index].title}\n',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                              children: [
                                TextSpan(
                                  text: myData![index].content,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      height: 2,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                database.deleteNotes(myData![index].id);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
                    child: Text(
                      "Tidak ada catatan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}
