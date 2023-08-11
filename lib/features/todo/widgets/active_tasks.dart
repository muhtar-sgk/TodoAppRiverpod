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
    final tasks = ref.watch(taskProvider);
    return FutureBuilder(
      future: ,
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
                      task.isCompleted = true;
                      ref.read(taskProvider.notifier).markAsCompleted(task);
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