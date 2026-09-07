import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String? title;
  final String? description;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  const TaskCard({
    super.key,
    this.title,
    this.description,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    int index = 1;
    return Card(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(Icons.checklist_rtl_sharp, color: Colors.blue),
          ),
        ),
        title: Text('Task $index'),
        subtitle: Text(description ?? ''),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEdit,
              icon: Icon(Icons.edit, color: Colors.blueAccent, size: 20),
            ),
            IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete, color: Colors.red, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}