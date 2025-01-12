import 'package:flutter/material.dart';

class ExampleStateless extends StatelessWidget {
  const ExampleStateless({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, Flutter!'),
      ),
      body: const Column(
        children: [
          Text('Hello, World!'),
          Text('Hello, World!'),
          Text('Hello, World!'),
          Text('Hello, World!'),
          Text('Hello, World!'),
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
           // title = 'Bye, Flutter!';
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}