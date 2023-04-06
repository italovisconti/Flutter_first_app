import 'package:flutter/material.dart';

//Pages
import 'package:first_app/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notas App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const LogIn(title: "Notas App - Log In"),
    );
  }
}