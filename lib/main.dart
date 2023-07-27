import 'package:flutter/material.dart';
import 'day6/day6task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setSystemUIOverlayStyle(
    //    SystemUiOverlayStyle(statusBarColor: Colors.black));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter_intern',
      // home: Day4Screen(),
      home: Day6Screen(),
    );
  }
}
