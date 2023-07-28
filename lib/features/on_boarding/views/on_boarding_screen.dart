import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:riverpod_todoapp/core/common/widgets/white_space.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/features/on_boarding/views/widgets/first_page.dart';
import 'package:riverpod_todoapp/features/on_boarding/views/widgets/second_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/common/widgets/fading_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          PageView(
            controller: pageController,
            children: const [FirstPage(), SecondPage()],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
              bottom: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: Row(
                    children: const [
                      Icon(Ionicons.chevron_forward_circle, 
                      color: Colours.light),
                      WhiteSpace(width: 5),
                      FadingText(
                        'Skip',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 2,
                  effect: WormEffect(
                      dotHeight: 12,
                      spacing: 10,
                      dotColor: Colours.yellow.withOpacity(.5),
                      activeDotColor: Colours.light),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
