import 'package:flutter/material.dart';
import 'package:todo_app_youtube/todo/MyWidgets/task_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
      ),
      body: ListView(
        children: const [
          TaskWidget(
            icon: Icon(Icons.task),
            title: 'Hacer mi cama',
            subtitle: 'Esto siempre en la mañana!',
          ),
           TaskWidget(
            icon: Icon(Icons.task),
            title: 'Hacer mi cama',
            subtitle: 'Esto siempre en la mañana!',
          ),
           TaskWidget(
            icon: Icon(Icons.task),
            title: 'Hacer mi cama',
            subtitle: 'Esto siempre en la mañana!',
          ),
           TaskWidget(
            icon: Icon(Icons.task),
            title: 'Hacer mi cama',
            subtitle: 'Esto siempre en la mañana!',
          ),
           TaskWidget(
            icon: Icon(Icons.task),
            title: 'Hacer mi cama',
            subtitle: 'Esto siempre en la mañana!',
          ),
          
          // Text('Estudiar ingles mientras voy en el tren'),
          // Text('Prepararme para el meeting del día'),
          // Text('Hacer un todo de mis actividades')
        ],
      ),
    );
  }
}
