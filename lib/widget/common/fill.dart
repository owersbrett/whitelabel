import 'package:flutter/material.dart';

class Fill extends StatelessWidget {
  const Fill({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
      ],
    );
  }
}
