import 'package:flutter/material.dart';
import 'package:notes_offline/screens/about_screen.dart';
import 'package:notes_offline/screens/content_screen.dart';
import 'package:notes_offline/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
      ),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/content': (context) => const ContentScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
