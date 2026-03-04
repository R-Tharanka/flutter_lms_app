import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double percent; // 0.0 - 1.0
  const ProgressCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.percent,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final clampedPercent = percent.clamp(0.0, 1.0);
    return Card(
      color: colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: clampedPercent,
              minHeight: 8,
              backgroundColor: colorScheme.outlineVariant,
              borderRadius: const BorderRadius.all(Radius.circular(99)),
            ),
            const SizedBox(height: 6),
            Text(
              '${(clampedPercent * 100).toStringAsFixed(0)}% completed',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
