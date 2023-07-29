import 'package:flutter/material.dart';
import 'package:riverpod_todoapp/features/authentication/repository/authentication_repository.dart';

class AuthenticationController {
  final AuthenticationRepository repository;

  const AuthenticationController(this.repository);

  Future<void> sendOTP({
    required BuildContext context,
    required String phoneNumber
  }) async {
    repository.sendOTP(context: context, phoneNumber: phoneNumber);
  }
}