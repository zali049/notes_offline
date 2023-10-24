import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade700,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            true,
                          );
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
                    ),
                    const Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "About Apps",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 0,
                      child: SizedBox(
                        width: 50,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: Center(
                        child: Image.asset("assets/images/IconApp.png"),
                      ),
                    ),
                    const Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'App Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                                Text('Notes Offline'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Version',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                                Text('1'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Package',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                                Text('com.zalidev.notesoffline.notes_offline'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
