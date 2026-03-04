import 'package:flutter/material.dart';
import '../widgets/progress_card.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';
import '../screens/courses_screen.dart';
import '../screens/assignments_screen.dart';
import '../screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      _dashboardTab(),
      const CoursesScreen(),
      const AssignmentsScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      appBar: _index == 0
          ? AppBar(
              title: Text(
                'LMS',
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            )
          : null,
      body: tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Assignments'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _dashboardTab() {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final double progressListHeight = (size.height * 0.22).clamp(150.0, 190.0);
    final double progressCardWidth = (size.width * 0.72).clamp(220.0, 320.0);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back, User!',
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          SizedBox(
            height: progressListHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: progressCardWidth,
                  child: const ProgressCard(
                    title: 'Flutter for Beginners',
                    subtitle: 'Chapter 2 of 12',
                    percent: 0.3,
                  ),
                ),
                SizedBox(
                  width: progressCardWidth,
                  child: const ProgressCard(
                    title: 'Dart Programming',
                    subtitle: 'Chapter 5 of 10',
                    percent: 0.5,
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Continue Learning',
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ...dummyCourses.map((c) => CourseCard(course: c, onTap: () {})),
        ],
      ),
    );
  }
}
