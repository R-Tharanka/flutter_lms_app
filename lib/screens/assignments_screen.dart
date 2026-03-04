import 'package:flutter/material.dart';
import '../widgets/app_bar_simple.dart';
import '../models/assignment.dart';
import '../widgets/assignment_card.dart';
import '../ui/app_spacing.dart';
import '../ui/layout.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(title: 'Assignments'),
      body: AppLayout.centeredConstrained(
        maxWidth: 720,
        child: ListView.separated(
          padding: AppSpacing.listPadding(context),
          itemCount: dummyAssignments.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (ctx, i) =>
              AssignmentCard(assignment: dummyAssignments[i]),
        ),
      ),
    );
  }
}
