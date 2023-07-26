import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_todoapp/core/common/widgets/white_space.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
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
      backgroundColor: Colours.darkBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(ImageRes.todo),
            const WhiteSpace(height: 80),
            Text(
              'Todo with Riverpod',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 30, 
                fontWeight: FontWeight.w500,
                color: Colours.light
              ),
            ),
            const WhiteSpace(height: 8),
            Text(
              'Welcome in Todo with Riverpod, you can create and clear note super fast',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colours.lightGrey
              ),
            )
          ]),
        ),
      ),
    );
  }
}
