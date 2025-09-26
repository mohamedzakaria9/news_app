import 'package:flutter/material.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  static String routeName = "onboarding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OnBoarding Screen"),
      ),
      body: Placeholder(
        color: Colors.amber,
    ),
    );
  }
}
