import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todoapp/core/helper/db_helper.dart';
import 'package:riverpod_todoapp/features/todo/models/task_model.dart';

part 'task_provider.g.dart';

@riverpod
class Task extends _$Task {
  @override
  List<TaskModel> build() => [];

  void refresh() async {
    final data = await DBHelper.getTasks();

    state = data.map((taskData) {
      return TaskModel.fromMap(taskData);
    }).toList();
  }

  Future<void> addTask(TaskModel task) async {
    await DBHelper.addTask(task);
    refresh();
  }

  Future<void> deleteTask(int taskId) async {
    await DBHelper.deleteTask(taskId);
    refresh();
  }

  Future<List<TaskModel>> getTasksForToday() async {
    final today = DateTime.now();

    if(state.isEmpty) return state;
    return state.where((task) {
      return DateUtils.isSameDay(task.date, today);
    }).toList();
  }

  Future<List<TaskModel>> getTasksForDayAfterTomorrow() async {
    final dayAfterTomorrow = DateTime.now().add(const Duration(days: 1));

    if(state.isEmpty) return state;
    return state.where((task) {
      return DateUtils.isSameDay(task.date, dayAfterTomorrow);
    }).toList();
  }
}