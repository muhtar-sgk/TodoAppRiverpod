import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_todoapp/core/res/colours.dart';
import 'package:riverpod_todoapp/features/todo/app/task_provider.dart';
import 'package:riverpod_todoapp/features/todo/utils/todo_utils.dart';
import 'package:riverpod_todoapp/features/todo/views/add_task_screen.dart';
import 'package:riverpod_todoapp/features/todo/widgets/todo_tile.dart';

class TasksForTomorrow extends ConsumerWidget {
  const TasksForTomorrow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);
    return FutureBuilder(
      future: TodoUtils.getTasksForTomorrow(tasks),
      builder: (_, snapshot) {
        if(snapshot.hasData && snapshot.data != null) {
          return ExpansionTile(title: Text('Hello'), subtitle: Text('Crooots'),);
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
                  endIcon: const Icon(
                    AntDesign.checkcircle,
                    color: Colours.green,
                  )
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