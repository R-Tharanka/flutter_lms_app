import 'package:flutter/material.dart';
import '../widgets/progress_card.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';

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
      const CoursesScreenPlaceholder(),
      const AssignmentsScreenPlaceholder(),
      const ProfileScreenPlaceholder(),
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

// Small placeholders to keep HomeScreen contained — these screens are implemented separately but
// referenced as placeholders to show bottom navigation working without routing in this file.
class CoursesScreenPlaceholder extends StatelessWidget {
  const CoursesScreenPlaceholder({super.key});
  @override
  Widget build(BuildContext context) => const Center(
    child: Padding(
      padding: EdgeInsets.all(24.0),
      child: Text(
        'Courses Tab — tap Courses in the menu to open the Courses screen from route.',
      ),
    ),
  );
}

class AssignmentsScreenPlaceholder extends StatelessWidget {
  const AssignmentsScreenPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Assignments Tab'));
}

class ProfileScreenPlaceholder extends StatelessWidget {
  const ProfileScreenPlaceholder({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Profile Tab'));
}
