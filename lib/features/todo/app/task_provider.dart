import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todoapp/core/helper/db_helper.dart';
import 'package:riverpod_todoapp/features/todo/models/task_model.dart';

import '../../../core/res/colours.dart';

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

  Future<void> markAsCompleted(TaskModel task) async {
    await DBHelper.updateTask(task);
    refresh();
  }
}