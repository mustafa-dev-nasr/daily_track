import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Center(child: Text("HomeScreen")))),
    );
  }
}
