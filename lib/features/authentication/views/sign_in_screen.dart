import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_todoapp/core/common/widgets/round_button.dart';
import 'package:riverpod_todoapp/core/common/widgets/white_space.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/core/res/image_res.dart';
import 'package:riverpod_todoapp/features/authentication/controller/authentication_controller.dart';
import 'package:riverpod_todoapp/features/authentication/views/otp_verification_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final border =
        OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16)
        );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: const PageScrollPhysics(),
            shrinkWrap: true,
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
                    fontWeight: FontWeight.w500),
              ),
              const WhiteSpace(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colours.darkBackground,
                  fontWeight: FontWeight.w700),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colours.light,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 14),
                    child: GestureDetector(
                      onTap: (){
                        showCountryPicker(
                          context: context, 
                          onSelect: (code){},
                          countryListTheme: CountryListThemeData(
                            backgroundColor: Colours.darkBackground,
                            bottomSheetHeight: MediaQuery.of(context).size.height * .6,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            textStyle: GoogleFonts.poppins(
                              color: Colours.light
                            ),
                            searchTextStyle: GoogleFonts.poppins(
                              color: Colours.light
                            ),
                            inputDecoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Search',
                              hintStyle: GoogleFonts.poppins(
                                color: Colours.lightGrey
                              ),
                              hintText: 'Search'
                            )
                          ),
                        );
                      },
                      child: Text(
                        '+62',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colours.darkBackground,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5
                  ),
                  focusedBorder: border,
                  enabledBorder: border,
                )
              ),
              const WhiteSpace(height: 30),
              RoundButton(
                text: 'Send code',
                onPressed: (){
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
