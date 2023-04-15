import 'package:flutter/material.dart';
import 'package:flutter_16/view/notes_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //color: Colors.greenAccent,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const NotesPage(),
    );
  }
}
