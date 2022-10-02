import 'package:flutter/material.dart';

class LoadingResource extends StatelessWidget {
  const LoadingResource({Key? key, this.resource}) : super(key: key);
  final String? resource;

  String get text => resource == null ? "Loading ${resource!}...": "Loading...";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children:  [
        const CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
      ],
    );
  }
}
