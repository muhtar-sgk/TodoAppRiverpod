import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/common/widgets/fading_text.dart';
import '../../../../core/common/widgets/white_space.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/image_res.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(ImageRes.todo),
        const WhiteSpace(height: 80),
        const FadingText('Todo with Riverpod',
            textAlign: TextAlign.center,
            fontSize: 30,
            fontWeight: FontWeight.w500),
        const WhiteSpace(height: 8),
        Text(
          'Welcome in Todo with Riverpod, you can create and clear note super fast',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colours.lightGrey),
        ),
      ]),
    );
  }
}
