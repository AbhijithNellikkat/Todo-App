import 'dart:developer';

import 'package:book_app/features/Todos/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoProvider extends ChangeNotifier {
  final Box<TodoModel> box = Hive.box<TodoModel>('Todo_database');

  // ================ Add Todo ================
  Future<void> addTodo(TodoModel todos) async {
    await box.add(todos);
    log('todo added');
    notifyListeners();
  }

  // ================ Delete Todo ================
  Future<void> deleteTodo(int index) async {
    await box.deleteAt(index);
    notifyListeners();
  }

  // ================ Update Todo ================
  // Future<void> updateTodo(
  //     {required int index,
  //     required taskTitle,
  //     required task,
  //     }) async {
  //   await box.putAt(
  //     index,
  //     TodoModel(
  //       taskTitle: taskTitle,
  //       task: task,
  //       isCompleted: false,
  //     ),
  //   );
  //   notifyListeners();
  // }

  // ================ Compeleted  Todo ================
  Future<void> compeletedTodo(TodoModel todos) async {
    await todos.save();
    notifyListeners();
  }
}
