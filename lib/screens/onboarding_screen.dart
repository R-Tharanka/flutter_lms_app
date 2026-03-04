import 'package:flutter/material.dart';
import '../app_routes.dart';
import '../ui/layout.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _page = i),
                children: [
                  _buildPage(
                    size,
                    'Welcome',
                    'Learn anytime, anywhere',
                    'assets/images/onboarding1-cr.png',
                  ),
                  _buildPage(
                    size,
                    'Track Progress',
                    'Progress cards and dashboards',
                    'assets/images/onboarding2-cr.png',
                  ),
                  _buildPage(
                    size,
                    'Start Learning',
                    'Explore courses and lessons',
                    'assets/images/onboarding3-cr.png',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.login,
                    ),
                    child: const Text('Skip'),
                  ),
                  Row(
                    children: List.generate(
                      3,
                      (i) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _page == i ? 16 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _page == i
                              ? Theme.of(context).primaryColor
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_page == 2) {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        );
                        return;
                      }
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(_page == 2 ? 'Get Started' : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(Size size, String title, String subtitle, String image) {
    final imageHeight = (size.height * 0.35).clamp(220.0, 360.0);
    return Padding(
      padding: const EdgeInsets.all(0),
      child: AppLayout.centeredConstrained(
        maxWidth: 520,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: size.width * 0.7,
              height: imageHeight,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
