import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todoapp/core/extensions/date_extensions.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/features/todo/app/task_provider.dart';
import 'package:riverpod_todoapp/features/todo/utils/todo_utils.dart';
import 'package:riverpod_todoapp/features/todo/views/add_task_screen.dart';
import 'package:riverpod_todoapp/features/todo/widgets/task_expansion_tile.dart';
import 'package:riverpod_todoapp/features/todo/widgets/todo_tile.dart';

class TasksForDayAfterTomorrow extends ConsumerWidget {
  const TasksForDayAfterTomorrow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);
    return FutureBuilder(
      future: TodoUtils.getTasksForDayAfterTomorrow(tasks),
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final colour = Colours.randomColour();
          return TaskExpansionTile(
            title: 'After Tomorrow',
            colour: colour,
            subtitle: "Excluding today's and tomorrow's",
            children: snapshot.data!.map((task) {
              final isLast = snapshot.data!.indexWhere((element) => 
              element.id == task.id) == snapshot.data!.length - 1;
              return TodoTile(
                task, 
                colour: colour,
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
                )
                );
            }).toList(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
