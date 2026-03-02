import 'package:flutter/material.dart';
import '../widgets/app_bar_simple.dart';
import '../widgets/primary_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _editing = false;
  final _nameController = TextEditingController(text: 'Kasun Udara');
  final _bioController = TextEditingController(
    text: 'Final-year Software Engineering student.',
  );
  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final completedCourses = [
      'Flutter for Beginners',
      'Dart Programming',
      'UI Design Basics',
    ];
    return Scaffold(
      appBar: AppBarSimple(title: 'Profile'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                child: Text(
                  _nameController.text.isNotEmpty
                      ? _nameController.text[0]
                      : 'U',
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (!_editing) ...[
              Center(
                child: Text(
                  _nameController.text,
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Center(
                child: Text(
                  _bioController.text,
                  style: textTheme.bodyMedium?.copyWith(fontSize: 18),
                ),
              ),
            ] else ...[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _bioController,
                decoration: const InputDecoration(labelText: 'Bio'),
                ),
            ],
            
            const SizedBox(height: 20),
            PrimaryButton(
              label: _editing ? 'Save' : 'Edit Profile',
              onPressed: () => setState(() => _editing = !_editing),
            ),
            const SizedBox(height: 26),

            Text(
              'Completed Courses',
              style: textTheme.titleMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),
            ...completedCourses.map(
              (title) => ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: const VisualDensity(vertical: -2),
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: Text(
                  title,
                  style: textTheme.bodyMedium?.copyWith(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
