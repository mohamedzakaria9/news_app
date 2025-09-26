import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  static String routeName = "home";
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Placeholder(
        color: Colors.amber,
      ),
    );
  }
}
