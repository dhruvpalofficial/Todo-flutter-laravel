import 'package:flutter/material.dart';
import 'package:todoey/text_title.dart';
import 'todo_model.dart';

class TaskArea extends StatelessWidget {
  final List<Todo> taskList;
  final Function(int) deleteTask;
  final Function(int, bool) updateTask;

  const TaskArea({
    super.key,
    required this.taskList,
    required this.deleteTask,
    required this.updateTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          final todo = taskList[index];

          return TextTitle(
            taskText: todo.title,
            isDone: todo.isDone,
            key: ValueKey(todo.id),
            onLongPress: () => deleteTask(todo.id),
            onChanged: (value) {
              updateTask(todo.id, value ?? false);
            },
          );
        },
      ),
    );
  }
}
