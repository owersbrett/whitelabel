import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth.dart';
import '../../bloc/user/user.dart';
import '../common/fill.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController username;
  late TextEditingController password;

  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            List<Widget> children = [
              Center(
                child: TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(SignOut());
                    },
                    child:const  Text("Authorized")),
              )
            ];
            if (authState is AuthInitial) {
              if (userState is UserInitial) {
                children = [];
                children.add(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(controller: username, decoration: const InputDecoration(hintText: "Username")),
                  ),
                );
                children.add(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      controller: password,
                      decoration: const InputDecoration(hintText: "Password"),
                      obscureText: true,
                    ),
                  ),
                );
                children.add(
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(SignIn(username.text, password.text));
                    },
                    child: const Text("Sign In"),
                  ),
                );
              }
            }
            return Scaffold(
              body: Fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
