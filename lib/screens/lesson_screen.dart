import 'package:flutter/material.dart';
import '../models/course.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});
  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  bool _completed = false;
  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Course course = args['course'];
    final int lessonIndex = args['lessonIndex'];
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${course.title} - Lesson ${lessonIndex + 1}',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _opacity,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[300],
                ),
                child: const Center(
                  child: Icon(Icons.play_circle_outline, size: 64),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Lesson ${lessonIndex + 1}',
              style: textTheme.titleMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Placeholder for the lesson content (video/reading).',
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _completed = !_completed;
                  _opacity = _completed ? 0.6 : 1.0;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _completed ? 'Marked complete' : 'Marked incomplete',
                    ),
                  ),
                );
              },
              child: Text(_completed ? 'Mark Incomplete' : 'Mark Complete'),
            ),
          ],
        ),
      ),
    );
  }
}
