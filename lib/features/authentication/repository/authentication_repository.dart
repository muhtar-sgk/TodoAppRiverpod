import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todoapp/core/helper/db_helper.dart';
import 'package:riverpod_todoapp/core/utils/core_utils.dart';
import 'package:riverpod_todoapp/features/authentication/views/otp_verification_screen.dart';
import 'package:riverpod_todoapp/features/todo/views/home_screen.dart';

final authRepoProvider =
    Provider((ref) => AuthenticationRepository(auth: FirebaseAuth.instance));

class AuthenticationRepository {
  final FirebaseAuth auth;

  const AuthenticationRepository({required this.auth});

  Future<void> sendOTP(
      {required BuildContext context, required String phoneNumber}) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) {
          auth.signInWithCredential(credential);
        },
        verificationFailed: (exception) {
          CoreUtils.showSnackBar(
              context: context,
              message: '${exception.credential}: ${exception.message}');
        },
        codeSent: (verificationId, _) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => OTPVerificationScreen(
                verificationId: verificationId
              )));
        },
        codeAutoRetrievalTimeout: (verificationId) {});
  }

  Future<void> verifyOTP(
      {required BuildContext context,
      required String verificationId,
      required String otp}) async {
    try {
      void showSnack(message) =>
          CoreUtils.showSnackBar(context: context, message: message);

      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);

      final userCredential = await auth.signInWithCredential(credential);
      final navigator = Navigator.of(context);

      if (userCredential.user != null) {
        await DBHelper.createUser(isVerified: true);
        navigator.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const HomeScreen()
          ),
          (route) => false);
      } else {
        showSnack('Error occured, failed to sign up user');
      }
    } on FirebaseException catch (e) {
      CoreUtils.showSnackBar(
        context: context, 
        message: '${e.code}: ${e.message}'
      );
    } catch(e) {
      CoreUtils.showSnackBar(
        context: context, 
        message: '500: Error occured, failed to sign up user'
      );
    }
  }
}
