import 'package:flutter/material.dart';
import '../models/assignment.dart';
import '../ui/status_colors.dart';

class AssignmentCard extends StatelessWidget {
  final Assignment assignment;

  const AssignmentCard({super.key, required this.assignment});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final statusColors = Theme.of(context).extension<StatusColors>();
    final isSubmitted = assignment.status == 'Submitted';

    final badgeBg = isSubmitted
        ? statusColors?.submittedBg ?? Colors.green.shade100
        : statusColors?.pendingBg ?? Colors.orange.shade100;
    final badgeFg = isSubmitted
        ? statusColors?.submittedFg ?? Colors.green.shade800
        : statusColors?.pendingFg ?? Colors.orange.shade800;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                assignment.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyLarge,
              ),
            ),
            const SizedBox(width: 12),
            DecoratedBox(
              decoration: BoxDecoration(
                color: badgeBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Text(
                  assignment.status,
                  style: textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.normal,
                    color: badgeFg,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
