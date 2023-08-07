import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_todoapp/core/common/widgets/filled_field.dart';
import 'package:riverpod_todoapp/core/common/widgets/round_button.dart';
import 'package:riverpod_todoapp/core/common/widgets/white_space.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';

class AddTaskScreen extends HookWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final hintStyle = GoogleFonts.poppins(
        fontSize: 16, color: Colours.lightGrey, fontWeight: FontWeight.w600);

    return Scaffold(
      body: SafeArea(
          child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
          const WhiteSpace(height: 20),
          FilledField(
            controller: titleController,
            hintText: 'Add title',
            hintStyle: hintStyle,
          ),
          const WhiteSpace(height: 20),
          FilledField(
            controller: descriptionController,
            hintText: 'Add description',
            hintStyle: hintStyle,
          ),
          const WhiteSpace(height: 20),
          RoundButton(
            onPressed: () {},
            text: 'Set date',
            backgroundColor: Colours.lightGrey,
            borderColor: Colours.light,
          ),
          const WhiteSpace(height: 20),
          Row(
            children: [
              Expanded(
                child: RoundButton(
                  onPressed: () {},
                  text: 'Start time',
                  backgroundColor: Colours.lightGrey,
                  borderColor: Colours.light,
                ),
              ),
              const WhiteSpace(width: 20),
              Expanded(
                child: RoundButton(
                  onPressed: () {},
                  text: 'End time',
                  backgroundColor: Colours.darkGrey,
                  borderColor: Colours.light,
                ),
              ),
            ],
          ),
          const WhiteSpace(height: 20),
          RoundButton(
            onPressed: () {},
            text: 'Submit',
            backgroundColor: Colours.green,
            borderColor: Colours.light,
          ),
                ],
              )),
    );
  }
}
