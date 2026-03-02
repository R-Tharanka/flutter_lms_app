import 'package:flutter/material.dart';
import '../models/course.dart';
import '../app_routes.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Course course = ModalRoute.of(context)!.settings.arguments as Course;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.title,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                course.image,
                width: double.infinity,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              course.title,
              style: textTheme.titleMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text('Instructor: ${course.instructor}'),
            const SizedBox(height: 12),
            Text(course.description),
            const SizedBox(height: 12),
            Text(
              'Lessons',
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: course.lessons,
              itemBuilder: (ctx, i) => ListTile(
                leading: const Icon(Icons.play_circle_outline),
                title: Text('Lesson ${i + 1}'),
                subtitle: Text('Duration: ${(10 + i)} mins'),
                trailing: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRoutes.lesson,
                    arguments: {'course': course, 'lessonIndex': i},
                  ),
                  child: const Text('Open'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
