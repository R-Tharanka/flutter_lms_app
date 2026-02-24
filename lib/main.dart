import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'theme.dart';

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS App',
      theme: AppTheme.light(),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      // home: const Scaffold(
      //   body: Center(child: Text('Welcome to the LMS App!')),
      // ),
      debugShowCheckedModeBanner: false,
    );
  }
}
