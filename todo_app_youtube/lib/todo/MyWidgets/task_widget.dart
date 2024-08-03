import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget(
      {super.key, required this.icon, required this.title, this.subtitle = ""});
  final Icon icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: icon,
      title: Text(title),
      subtitle: Text(subtitle),
    ));
  }
}
