import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Notes Basic'),
        ),
      ),
      body: const Center(
        child: Text('DASHBOARD'),
      ),
    );
  }
}
