import 'package:flutter/material.dart';

import '../common/fill.dart';
import '../common/loading_resource.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key, this.pageName}) : super(key: key);
  final String? pageName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Fill(
        child: LoadingResource(resource: pageName)
      ),
    );
  }
}
