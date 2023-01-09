import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './widget/home.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

// widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
