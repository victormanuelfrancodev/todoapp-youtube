import 'package:flutter/material.dart';
import 'package:todo_app_youtube/example_stateless/clock.dart';

class ExampleStateful extends StatefulWidget {
  const ExampleStateful({super.key});

  @override
  State<ExampleStateful> createState() => _ExampleStatefulState();
}

class _ExampleStatefulState extends State<ExampleStateful> {
  
  String _title = 'Hello, Flutter!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: const Column(
        children: [
         Text('Hello, World!'),
         Text('Hello, World!'),
         Text('Hello, World!'),
         Text('Hello, World!'),
         Clock(),
         Text('Hello, World!'),
         Text('Hello, World!'),
         Text('Hello, World!'),
         Text('Hello, World!'),
         Text('Hello, World!'),
         Text('Hello, World!'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           _title = 'Bye, Flutter!';
           setState(() {
             
           });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}