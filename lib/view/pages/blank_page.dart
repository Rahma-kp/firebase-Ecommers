import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
