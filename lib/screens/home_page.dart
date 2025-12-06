import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_hive_bloc/bloc/home_bloc.dart';
import 'package:todo_hive_bloc/services/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usernameField = TextEditingController();
  final passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (context) =>
                HomeBloc(RepositoryProvider.of<Authentication>(context)),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial) {
                  return Column(
                    spacing: 10,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: usernameField,
                        decoration: InputDecoration(
                          labelText: 'UserName',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextField(
                        controller: passwordField,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(
                            LoginEvent(
                              username: usernameField.text,
                              password: passwordField.text,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
