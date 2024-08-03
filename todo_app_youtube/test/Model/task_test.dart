import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_youtube/todo/Model/task.dart';

void main() {
  group("Task test", () {
    test(
      'Default values - Factory newTask',
      () {
        var task = Task.newTask();
        expect(task.title, 'Name Task');
        expect(task.assign, 'Asigna a un comapañero');
      },
    );
    test(
      'copyWith',
      () {
        var task = Task(
            id: 6,
            title: "Title 6",
            description: "description 6",
            priority: TaskPriority.low,
            status: TaskStatus.todo,
            assign: "Admin");
        var updateTask = task.copyWith(title: 'Real Title');
        expect(updateTask.title, 'Real Title');
        expect(updateTask.description, 'description 6');
        expect(updateTask.assign, 'Admin');
      },
    );

    test(
      'Task.fromJson deserialize JSON',
      () {
        String taskJson = '''
                {
                  "id": 2,
                  "title": "New Task",
                  "description": "New task description",
                  "assign": "Alice",
                  "status": "inProgress"
                }
              ''';
        Task task = Task.fromJson(taskJson);
        expect(task.title, 'New Task');
        expect(task.description, 'New task description');
      },
    );

    test(
      'Task.priority should assign correct assigness',
      () {
        Task hightPriority = Task.priority(TaskPriority.high);
        expect(hightPriority.assign, 'Senior');
        Task lowPriority = Task.priority(TaskPriority.low);
        expect(lowPriority.assign, 'Jr');
      },
    );
  });
}
