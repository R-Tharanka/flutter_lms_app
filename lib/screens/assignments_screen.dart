import 'package:flutter/material.dart';
import '../widgets/app_bar_simple.dart';
import '../models/assignment.dart';
import '../widgets/assignment_card.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(title: 'Assignments'),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: dummyAssignments.length,
        itemBuilder: (ctx, i) =>
            AssignmentCard(assignment: dummyAssignments[i]),
      ),
    );
  }
}
