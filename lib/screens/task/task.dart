import 'package:flutter/material.dart';
import 'package:picktask/utils/color.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: Text(
        "Task",
        style: TextStyle(color: kWhiteColor),
      )),
    );
  }
}
