import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'Week 1 Quiz', 'status': 'Submitted'},
      {'title': 'Project Proposal', 'status': 'Pending'},
      {'title': 'Week 3 Assignment', 'status': 'Pending'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Assignments')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) => ListTile(
          title: Text(items[i]['title']!),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: items[i]['status'] == 'Submitted'
                  ? Colors.green[100]
                  : Colors.orange[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              items[i]['status']!,
              style: TextStyle(
                color: items[i]['status'] == 'Submitted'
                    ? Colors.green[800]
                    : Colors.orange[800],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
