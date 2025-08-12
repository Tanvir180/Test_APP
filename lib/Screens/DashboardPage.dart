import 'package:flutter/material.dart';
import 'dart:async';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Scaffold(
          body: Center(
            child: Text("Dashboard", style: TextStyle(fontSize: 24)),
          ),
        ),
        const Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Text(
            "Beta Version 1.0",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
