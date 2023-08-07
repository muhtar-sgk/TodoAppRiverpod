import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/colours.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;

  const RoundButton({
    super.key,
    required this.text,
    this.onPressed, 
    this.backgroundColor, 
    this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colours.light,
            minimumSize: Size(size.width * .9, size.height * .06),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: borderColor == null 
                ? BorderSide.none
                : BorderSide(color: borderColor!)
            )
          ),
          onPressed: onPressed, 
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: borderColor ?? Colours.light
            ),
          )
        );
  }
}