import 'package:flutter/material.dart';
import '../models/course.dart';
import '../app_routes.dart';
import '../ui/app_spacing.dart';
import '../ui/layout.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Course course = ModalRoute.of(context)!.settings.arguments as Course;
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final double headerImageHeight = (size.width * 0.45).clamp(160.0, 240.0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.title,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: AppSpacing.screenPadding(context),
        child: AppLayout.centeredConstrained(
          maxWidth: 720,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  course.image,
                  width: double.infinity,
                  height: headerImageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Text(course.title, style: textTheme.titleLarge),
              const SizedBox(height: 6),
              Text('Instructor: ${course.instructor}'),
              const SizedBox(height: 12),
              Text(course.description),
              const SizedBox(height: 16),
              Text('Lessons', style: textTheme.titleMedium),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: course.lessons,
                itemBuilder: (ctx, i) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.play_circle_outline),
                  title: Text('Lesson ${i + 1}'),
                  subtitle: Text('Duration: ${(10 + i)} mins'),
                  trailing: SizedBox(
                    width: 92,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        AppRoutes.lesson,
                        arguments: {'course': course, 'lessonIndex': i},
                      ),
                      child: const Text(
                        'Open',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
