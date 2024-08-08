import 'package:flutter/material.dart';
import 'package:todo_app_youtube/todo/Model/task.dart';
import 'package:todo_app_youtube/todo/MyWidgets/task_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String tasksJson = '''
  [
    {
      "id": 2,
      "title": "New Task",
      "description": "New task description",
      "assign": "Alice",
      "status": "inProgress"
    },
    {
      "id": 3,
      "title": "Another Task",
      "description": "Another task description",
      "assign": "Bob",
      "status": "completed"
    },
    {
      "id": 4,
      "title": "Yet Another Task",
      "description": "Yet another task description",
      "assign": "Charlie",
      "status": "todo"
    },
    {
      "id": 5,
      "title": "Final Task",
      "description": "This is the final task description",
      "assign": "Dave",
      "status": "inProgress"
    }
  ]
  ''';
    final taskList = Task.listFromJson(tasksJson);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
      ),
      body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int index) {
            final task = taskList[index];
            return TaskWidget(
              icon: const Icon(Icons.task),
              title: task.title,
              subtitle: task.description,
            );
          }),
    );
  }
}
