import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';

import '../../../../core/common/widgets/white_space.dart';
import '../../../../core/res/image_res.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(ImageRes.todo),
        const WhiteSpace(height: 50),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colours.light,
            minimumSize: Size(size.width * .9, size.height * .06)
          ),
          onPressed: (){}, 
          child: Text(
            'Login with phone',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colours.darkBackground
            ),
          )
        )
      ]),
    );
  }
}
