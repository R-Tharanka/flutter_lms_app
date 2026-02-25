import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _editing = false;
  final _nameController = TextEditingController(text: 'Ruchira Tharanka');
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
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(
                _nameController.text.isNotEmpty ? _nameController.text[0] : 'U',
              ),
            ),
            const SizedBox(height: 12),
            if (!_editing) ...[
              Text(
                _nameController.text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(_bioController.text),
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
            const Spacer(),
            ElevatedButton(
              onPressed: () => setState(() => _editing = !_editing),
              child: Text(_editing ? 'Save' : 'Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
