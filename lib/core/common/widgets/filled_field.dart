import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/colours.dart';

class FilledField extends StatelessWidget {
  final TextEditingController? controller;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;

  const FilledField(
      {super.key,
      this.readOnly = false,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.keyboardType, 
      this.hintStyle
    });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16));

    return TextField(
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colours.darkBackground,
            fontWeight: FontWeight.w700),
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colours.light,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          focusedBorder: border,
          enabledBorder: border,
        ));
  }
}