import 'package:flutter/material.dart';
import '../common/fill.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, this.exception}) : super(key: key);
  final String? exception;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Fill(
        child: Text(exception ?? "Error"),
      ),
    );
  }
}
