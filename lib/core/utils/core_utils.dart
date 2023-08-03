import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';

class CoreUtils {
  const CoreUtils._();

  static void showSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message)
      )
    );
  }

  static void showLoader(BuildContext context, {String? message}) {
    showDialog(
      context: context, 
      builder: (_) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colours.lightBlue
            ),
            if(message != null) 
            Text(
              '$message...',
              style: GoogleFonts.poppins(
                color: Colours.lightBlue
              ),
            )
          ],
        ),
      ));

  }
}
