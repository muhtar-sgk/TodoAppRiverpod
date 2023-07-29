import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationRepository {
  final FirebaseAuth auth;

  const AuthenticationRepository({
    required this.auth
  });

  Future<void> sendOTP({
    required BuildContext context,
    required String phoneNumber
  }) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential){
        auth.signInWithCredential(credential);
      }, 
      verificationFailed: (exception){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${exception.code}: ${exception.message}')
          )
        );
      }, 
      codeSent: (verificationId, _){}, 
      codeAutoRetrievalTimeout: (verificationId){}
    );
  }
}