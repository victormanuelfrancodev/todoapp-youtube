import 'dart:convert';

enum TaskStatus { todo, inProgress, completed }

enum TaskPriority { high, low }

class Task {
  final int id;
  final String title;
  final String description;
  final String assign;
  final TaskPriority priority;
  final TaskStatus status;

  Task(
      {required this.id,
      required this.title,
      required this.description,
      this.priority = TaskPriority.low,
      this.status = TaskStatus.todo,
      this.assign = 'admin'});

  factory Task.newTask() {
    return Task(
        id: 1,
        title: 'Name Task',
        description: 'Agrega una descripción ',
        priority: TaskPriority.low,
        assign: 'Asigna a un comapañero');
  }

  Task copyWith(
      {String? title,
      String? description,
      String? assign,
      TaskPriority? priority,
      TaskStatus? status}) {
    return Task(
        id: id,
        title: title ?? this.title,
        description: description ?? this.description,
        assign: assign ?? this.assign,
        priority: priority ?? this.priority,
        status: status ?? this.status);
  }

  factory Task.priority(TaskPriority priority) {
    String assign;

    switch (priority) {
      case TaskPriority.low:
        assign = 'Jr';
      case TaskPriority.high:
        assign = 'Senior';
      default:
        assign = 'Admin';
    }

    return Task(
        id: 1,
        title: 'Nombre de Tarea',
        description: 'Agrega una descripción ',
        priority: TaskPriority.low,
        assign: assign);
  }

  factory Task.fromJson(String source) {
    Map<String, dynamic> map = jsonDecode(source);
    return Task.fromMap(map);
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        assign: map['assign'],
        status: _stringToTaskStatus(map['status']));
  }

  static List<Task> listFromJson(String source) {
    Iterable listTask = json.decode(source);
    return List<Task>.from(listTask.map((task) => Task.fromMap(task)));
  }

  static TaskStatus _stringToTaskStatus(String status) {
    switch (status) {
      case 'todo':
        return TaskStatus.todo;
      case 'inProgress':
        return TaskStatus.inProgress;
      case 'completed':
        return TaskStatus.completed;
      default:
        throw ArgumentError('Invalid Task status');
    }
  }
}

main() {
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

  print('////////');
  var task5 = Task.listFromJson(tasksJson);
  for (var task in task5) {
    print(task.title);
  }

  var task6 = Task(
      id: 6,
      title: "Title 6",
      description: "description 6",
      priority: TaskPriority.low,
      status: TaskStatus.todo,
      assign: "Admin");
  print(task6.title);
  task6 = task6.copyWith(title: "Title 666");   

}
