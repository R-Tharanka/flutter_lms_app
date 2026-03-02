import 'package:flutter/material.dart';
import '../models/assignment.dart';

class AssignmentCard extends StatelessWidget {
  final Assignment assignment;

  const AssignmentCard({Key? key, required this.assignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              assignment.title,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: assignment.status == 'Submitted'
                    ? Colors.green[100]
                    : Colors.orange[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                assignment.status,
                style: textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.normal,
                  color: assignment.status == 'Submitted'
                      ? Colors.green[800]
                      : Colors.orange[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
