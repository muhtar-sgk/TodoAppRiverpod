import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/features/todo/app/task_provider.dart';
import 'package:riverpod_todoapp/features/todo/widgets/todo_tile.dart';

class ActiveTasks extends ConsumerWidget {
  const ActiveTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(taskProvider.notifier).getActiveTasksForToday(),
      builder: (_, snapshot) {
        debugPrint(snapshot.data.toString());
        if(snapshot.hasData && snapshot.data != null) {
          if(snapshot.data!.isEmpty) {
            return Center(child: Text(
                'No pending tasks',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colours.light.withOpacity(.6),
                  fontWeight: FontWeight.bold
                ),
              )
            );
          }
          return ColoredBox(
            color: Colours.lightBackground,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) {
                final task = snapshot.data![index];
                return TodoTile(
                  task,
                  endIcon: Switch(
                    value: task.isCompleted,
                    onChanged: (_) {
                      
                    },
                  ),
                );
              }
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}