import 'package:flutter/material.dart';
import 'package:new_app/ui/home_screen/home_page/source/CategoryDetails.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryDetails(),
      ],
    );
  }
}
