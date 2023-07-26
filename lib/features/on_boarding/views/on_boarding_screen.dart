import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(ImageRes.todo),
            SizedBox(height: 100.h),
            const Text(
              'Todo with Riverpod',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h),
            const Text(
              'Welcome in Todo with Riverpod, you can create and clear note super fast',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            )
          ]),
        ),
      ),
    );
  }
}
