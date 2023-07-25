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
      body: Image.asset(ImageRes.todo),
    );
  }
}