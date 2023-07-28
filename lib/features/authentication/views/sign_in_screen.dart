import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_todoapp/core/common/widgets/white_space.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/core/res/image_res.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            Image.asset(ImageRes.todo),
            const WhiteSpace(height: 20),
            Text(
              'Please enter your number to get the verification code',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 17,
                color: Colours.light,
                fontWeight: FontWeight.w500
              ),
            ),
            const WhiteSpace(height: 20),
            TextField(
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colours.light,
                fontWeight: FontWeight.w700
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(

                )
              ),
            )
          ],
        ),
      ),
    );
  }
}