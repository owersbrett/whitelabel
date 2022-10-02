import 'package:flutter/material.dart';

import '../common/fill.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Fill(child: Center(child: Text("Welcome Home"),)),
    );
  }
}
