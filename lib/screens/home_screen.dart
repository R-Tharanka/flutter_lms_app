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
  _HomeScreenState createState() => _HomeScreenState();
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
      appBar: AppBar(title: const Text('LMS')),
      body: tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Assignments',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _dashboardTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back, User!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                //const Text('Keep learning — progress today!'),
              ],
            ),
          ),
          SizedBox(
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 240,
                child: ProgressCard(title: 'Flutter for Beginners', subtitle: 'Chapter 2 of 12', percent: 0.3),),
                SizedBox(width: 240,
                child: ProgressCard(title: 'Dart Programming', subtitle: 'Chapter 5 of 10', percent: 0.5),),
                SizedBox(width: 12),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Continue Learning',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          ...dummyCourses
              .map((c) => CourseCard(course: c, onTap: () {}))
              .toList(),
        ],
      ),
    );
  }
}
