import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boline',
      home: const Login(),
    );
  }
}


