import 'package:flutter/material.dart';
import 'dart:async';

import 'package:test_app/Screens/DashboardPage.dart';

class ProfileCreatingPage extends StatefulWidget {
  const ProfileCreatingPage({super.key});

  @override
  State<ProfileCreatingPage> createState() => _ProfileCreatingPageState();
}

class _ProfileCreatingPageState extends State<ProfileCreatingPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NextPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full background
          // Main content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Gray shape + Profile image stack
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'images/Background_Simple.png', // This is your gray shape PNG
                        width: 220,
                        height: 150,
                      ),
                      Image.asset(
                        'images/Profile.png', // Phone/profile PNG
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Main heading
                  const Text(
                    "Your profile is being\ncreated...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Sub text
                  const Text(
                    "Customising your recommendations...",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          // Footer text
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: const Text(
              "Beta Version 1.0",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}

