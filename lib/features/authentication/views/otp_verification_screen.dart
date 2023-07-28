import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_todoapp/core/common/widgets/white_space.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/core/res/image_res.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageRes.todo),
              const WhiteSpace(height: 26),
              Pinput(
                length: 6,
                onCompleted: (value) {
                  debugPrint(value);
                },
                defaultPinTheme: PinTheme(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16
                  ),
                  decoration: BoxDecoration(
                    color: Colours.light,
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
              )
            ],
          ),
        )),
    );
  }
}