import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/app_bar_simple.dart';
import '../widgets/course_card.dart';
import '../app_routes.dart';
import '../ui/app_spacing.dart';
import '../ui/layout.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(title: 'Courses'),
      body: AppLayout.centeredConstrained(
        maxWidth: 720,
        child: ListView.separated(
          padding: AppSpacing.listPadding(context),
          itemCount: dummyCourses.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (ctx, i) {
            final c = dummyCourses[i];
            return CourseCard(
              course: c,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.courseDetail,
                  arguments: c,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
