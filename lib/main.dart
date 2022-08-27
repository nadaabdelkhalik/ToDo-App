import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.brown,
          buttonTheme: const ButtonThemeData(buttonColor: Colors.brown)),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
