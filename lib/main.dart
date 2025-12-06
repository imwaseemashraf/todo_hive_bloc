import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_hive_bloc/screens/home.dart';
import 'package:todo_hive_bloc/screens/home_page.dart';
import 'package:todo_hive_bloc/services/authentication.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => Authentication())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
