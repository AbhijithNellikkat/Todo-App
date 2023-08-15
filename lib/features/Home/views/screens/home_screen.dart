import 'package:book_app/features/Todos/view_models/todo_database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Todos/views/screens/todo_screen.dart';
import '../../../Todos/views/widgets/todo_delete.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Consumer<TodoProvider>(
          builder: (context, value, child) {
            return Expanded(
              child: ListView.builder(
                  itemCount: value.box.length,
                  itemBuilder: (context, index) {
                    final todos = value.box.getAt(index);
                    return GestureDetector(
                      onTap: () {
                        if (todoProvider.box.isNotEmpty) {
                          todoDeleteShowDialog(
                              context, todoProvider, index, todos);
                        }
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            todos!.taskTitle,
                          ),
                          subtitle: Text(
                            todos.task,
                          ),
                         
                          trailing: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit)),
                        ),
                      ),
                    );
                  }),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
