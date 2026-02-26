import 'package:flutter/material.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';
import '../app_routes.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Courses')),
      body: ListView.builder(
       padding: const EdgeInsets.only(
          top: 16,
          left: 6,
          right: 6,
       ),
        itemCount: dummyCourses.length,
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
    );
  }
}
