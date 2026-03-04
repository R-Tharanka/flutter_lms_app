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
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(subtitle),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: percent),
            const SizedBox(height: 6),
            Text('${(percent * 100).toStringAsFixed(0)}% completed'),
          ],
        ),
      ),
    );
  }
}
