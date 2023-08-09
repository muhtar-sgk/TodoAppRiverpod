import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todoapp/core/common/widgets/filled_field.dart';
import 'package:riverpod_todoapp/core/common/widgets/round_button.dart';
import 'package:riverpod_todoapp/core/common/widgets/white_space.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/core/utils/core_utils.dart';
import 'package:riverpod_todoapp/features/todo/app/task_date_provider.dart';
import 'package:riverpod_todoapp/features/todo/app/task_provider.dart';
import 'package:riverpod_todoapp/features/todo/models/task_model.dart';

class AddTaskScreen extends HookConsumerWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final dateNotifier = ref.read(taskDateProvider.notifier);
    final startTimeNotifier = ref.read(taskStartTimeProvider.notifier);
    final endTimeNotifier = ref.read(taskEndTimeProvider.notifier);

    final dateProvider = ref.watch(taskDateProvider);
    final startProvider = ref.watch(taskStartTimeProvider);
    final endProvider = ref.watch(taskEndTimeProvider);

    final hintStyle = GoogleFonts.poppins(
        fontSize: 16, color: Colours.lightGrey, fontWeight: FontWeight.w600);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colours.light,
      ),
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
            onPressed: () {
              DatePicker.showDatePicker(context,
                  minTime: DateTime.now(),
                  maxTime: DateTime(DateTime.now().year + 1),
                  theme: DatePickerTheme(
                      doneStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colours.green)), onConfirm: (date) {
                dateNotifier.changeDate(date);
              });
            },
            text: dateProvider == null ? 'Set date' : dateNotifier.date()!,
            backgroundColor: Colours.lightGrey,
            borderColor: Colours.light,
          ),
          const WhiteSpace(height: 20),
          Row(
            children: [
              Expanded(
                child: RoundButton(
                  onPressed: () {
                    if (dateProvider == null) {
                      CoreUtils.showSnackBar(
                          context: context,
                          message: 'Please pick a date first');
                      return;
                    }
                    DatePicker.showDateTimePicker(
                      context,
                      onConfirm: (time) {
                        startTimeNotifier.changeTime(time);
                      },
                      currentTime: dateProvider,
                      theme: DatePickerTheme(
                          doneStyle: GoogleFonts.poppins(
                              fontSize: 16, color: Colours.green)),
                    );
                  },
                  text: startProvider == null
                      ? 'Start time'
                      : startTimeNotifier.time()!,
                  backgroundColor: Colours.lightGrey,
                  borderColor: Colours.light,
                ),
              ),
              const WhiteSpace(width: 20),
              Expanded(
                child: RoundButton(
                  onPressed: () {
                    if (startProvider == null) {
                      CoreUtils.showSnackBar(
                          context: context,
                          message: 'Please pick a start time first');
                      return;
                    }
                    DatePicker.showDateTimePicker(
                      context, 
                      onConfirm: (time) {
                        endTimeNotifier.changeTime(time);
                      },
                      currentTime: dateProvider,
                      theme: DatePickerTheme(
                        doneStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colours.green
                      )
                      ),
                    );
                  },
                  text: endProvider == null
                      ? 'End time'
                      : endTimeNotifier.time()!,
                  backgroundColor: Colours.darkGrey,
                  borderColor: Colours.light,
                ),
              ),
            ],
          ),
          const WhiteSpace(height: 20),
          RoundButton(
            onPressed: () async {
              if(titleController.text.trim().isNotEmpty &&
                  descriptionController.text.trim().isNotEmpty &&
                  dateProvider != null &&
                  startProvider != null &&
                  endProvider != null) {
                    final title = titleController.text.trim();
                    final description = descriptionController.text.trim();
                    final date = dateProvider;
                    final startTime = startProvider;
                    final endTime = endProvider;
                    final navigator = Navigator.of(context);
                    CoreUtils.showLoader(context);
                    await ref.read(taskProvider.notifier).addTask(TaskModel(
                      title: title,
                      description: description,
                      date: date,
                      startTime: startTime,
                      endTime: endTime
                    ));
                    navigator..pop()..pop();
                  } else {
                    CoreUtils.showSnackBar(
                      context: context, 
                      message: 'All fields are required'
                    );
                  }
            },
            text: 'Submit',
            backgroundColor: Colours.green,
            borderColor: Colours.light,
          ),
        ],
      )),
    );
  }
}
