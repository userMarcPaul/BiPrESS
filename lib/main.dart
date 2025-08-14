import 'package:flutter/material.dart';
import 'role_selection_page.dart'; // Ensure path is correct

void main() {
  runApp(const BPSUApp());
}

class BPSUApp extends StatelessWidget {
  const BPSUApp({Key? key}) : super(key: key); // ✅ Add const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harold Abogado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.blueGrey[50],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RoleSelectionPage(), // ✅ Launch RoleSelectionPage
    );
  }
}
