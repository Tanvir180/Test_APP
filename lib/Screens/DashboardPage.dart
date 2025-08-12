import 'package:flutter/material.dart';
import 'dart:async';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Dashboard", style: TextStyle(fontSize: 24))),
    );
  }
}
