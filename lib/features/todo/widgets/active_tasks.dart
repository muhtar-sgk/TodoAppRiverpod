import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/features/todo/app/task_provider.dart';
import 'package:riverpod_todoapp/features/todo/utils/todo_utils.dart';
import 'package:riverpod_todoapp/features/todo/views/add_task_screen.dart';
import 'package:riverpod_todoapp/features/todo/widgets/todo_tile.dart';

class ActiveTasks extends ConsumerWidget {
  const ActiveTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);
    return FutureBuilder(
      future: TodoUtils.getActiveTasksForToday(tasks),
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
                final isLast = index == snapshot.data!.length -1;
                return TodoTile(
                  task,
                  bottomMargin: isLast ? null : 10,
                  onDelete: () {
                    ref.read(taskProvider.notifier).deleteTask(task.id!);
                  },
                  onEdit: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (_) => AddOrEditTaskScreen(task: task)
                      )
                    );
                  },
                  endIcon: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: task.isCompleted,
                      onChanged: (_) {
                        task.isCompleted = true;
                        ref.read(taskProvider.notifier).markAsCompleted(task);
                      },
                    ),
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