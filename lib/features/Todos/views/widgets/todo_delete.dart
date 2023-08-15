import 'package:book_app/features/Todos/view_models/todo_database_provider.dart';
import 'package:flutter/material.dart';
import '../../models/data_model.dart';

Future<String?> todoDeleteShowDialog(BuildContext context,
    TodoProvider provider, int index, TodoModel todos) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Delete Todo'),
      content: const Text('Are you sure you want to delete this !'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            provider.deleteTodo(index);
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}
