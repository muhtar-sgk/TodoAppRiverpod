import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_todoapp/core/common/widgets/white_space.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/core/res/image_res.dart';
import 'package:riverpod_todoapp/features/authentication/controller/authentication_controller.dart';

import '../../../core/utils/core_utils.dart';

class OTPVerificationScreen extends ConsumerWidget {
  final String verificationId;

  const OTPVerificationScreen({
    super.key,
    required this.verificationId
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onCompleted: (pin) async {
                  // final navigator = Navigator.of(context);
                  CoreUtils.showLoader(context);
                  await ref.read(authControllerProvider).verifyOTP(
                    context: context, 
                    verificationId: verificationId, 
                    otp: pin
                  );
                  // navigator.pop();
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