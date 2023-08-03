import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todoapp/core/common/widgets/round_button.dart';
import 'package:riverpod_todoapp/core/common/widgets/white_space.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/core/res/image_res.dart';
import 'package:riverpod_todoapp/features/authentication/app/country_code_provider.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16)
    );
    final code = ref.watch(countryCodeProvider);

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
                          onSelect: (code){
                            ref.read(countryCodeProvider.notifier)
                            .changeCountry(code);
                          },
                          countryListTheme: CountryListThemeData(
                            backgroundColor: Colours.darkBackground,
                            bottomSheetHeight: MediaQuery.of(context).size.height * .6,
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                            textStyle: GoogleFonts.poppins(
                              color: Colours.light
                            ),
                            searchTextStyle: GoogleFonts.poppins(
                              color: Colours.light
                            ),
                            inputDecoration: InputDecoration(
                              border: const OutlineInputBorder(),
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
                        code == null ? 'Pick a country' : '${code
                          .flagEmoji}${code.phoneCode}',
                        style: GoogleFonts.poppins(
                          fontSize: code == null ? 13 : 18,
                          color: Colours.darkBackground,
                          fontWeight: code == null 
                            ? FontWeight.normal
                            : FontWeight.bold
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
