import 'package:flutter/material.dart';
import 'package:riverpod_todoapp/core/res/image_res.dart';

// OnboardingScreen
  // Imaga
  // Title
  // Sub Title
  // Skip Button
  // Swipe Indicator

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset(ImageRes.todo)
          )
        ]
      ),
    );
  }
}