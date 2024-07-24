import 'dart:convert';

enum TaskStatus { todo, inProgress, completed }

enum TaskPriority { high, low }

class Task {
  int id;
  String title;
  String description;
  String assign;
  TaskPriority priority;
  TaskStatus status;

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
        title: 'Nombre de Tarea',
        description: 'Agrega una descripción ',
        priority: TaskPriority.low,
        assign: 'Asigna a un comapañero');
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
  var task1 = Task(
      id: 1,
      title: 'Lavarme mis dientes',
      description: 'description 1 ',
      priority: TaskPriority.high,
      assign: 'Victor');

  print(task1.description);
  print(task1.status.name);

  task1.status = TaskStatus.completed;

  switch (task1.status) {
    case TaskStatus.todo:
      print('Nueva tarea');
    case TaskStatus.inProgress:
      print('Se esta realizando la tarea');
    case TaskStatus.completed:
      print('Se completo la tarea');
  }

  var task2 = Task.newTask();
  print(task2.title);

  var task3 = Task.priority(TaskPriority.high);
  print('Tarea asignada al ${task3.assign}');

  String taskJson = '''
    {
      "id": 5,
      "title": "Final Task",
      "description": "This is the final task description",
      "assign": "Dave",
      "status": "inProgress"
    }
  ''';

  var task4 = Task.fromJson(taskJson);
  print(task4.description);

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
}
