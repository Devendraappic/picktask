// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BlackBox extends StatefulWidget {
  Widget child;
  double decorationWidth, width, margin;

  BlackBox(
      {required this.child,
      required this.decorationWidth,
      required this.width,
      required this.margin});

  @override
  State<BlackBox> createState() => _BlackBoxState();
}

class _BlackBoxState extends State<BlackBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.decorationWidth),
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          // stops: [0.1, 0.4, 0.7, 0.9],
          colors: const [
            // Colors are easy thanks to Flutter's Colors class.
            Color(0xFF2B252A),
            Color(0xFF1F2131),
          ],
        ),
      ),
      child: widget.child,
    );
  }
}
