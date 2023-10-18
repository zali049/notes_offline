import 'package:flutter/material.dart';

AppBar appBarCustom() {
  return AppBar(
    title: Text("Dashboard"),
    centerTitle: true,
    backgroundColor: Colors.grey,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(50),
      ),
    ),
    leading: InkWell(
      onTap: () {},
      child: const Icon(
        Icons.subject,
        color: Colors.white,
      ),
    ),
    actions: [
      InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Icon(
            Icons.notifications,
            size: 20,
          ),
        ),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(200.0),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 30, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 32.0,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),

            Container(
              height: 200,
              margin: const EdgeInsets.only(left: 30),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hallo,",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white),
                  ),

                  Text(
                    "Rizal Ilmanudien",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                    textAlign: TextAlign.start,

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
