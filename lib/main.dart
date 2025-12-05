import 'package:flutter/material.dart';
import 'package:todo_hive_bloc/screens/home.dart';
import 'package:todo_hive_bloc/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Login(),
    );
  }
}
