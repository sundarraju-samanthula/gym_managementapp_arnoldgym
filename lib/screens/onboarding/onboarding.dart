import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/auth_controller.dart';
import '../login/loginbottomsheet.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/onboarding.png', fit: BoxFit.cover),
          ),

          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: AnimatedBusinessPhraseLeftAligned(),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Container(
                  child: Text(
                    "All your business operations in one place, ready for you to take charge.",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: SizedBox(
                  width: 328,
                  height: 0,
                  child: Divider(
                    color: Colors.white.withOpacity(0.7),
                    thickness: 1.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 28,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 184, 254, 34),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Container(
                    height: 45,
                    width: 328,

                    child: ElevatedButton(
                      onPressed: authController.onGetStarted,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(4),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Get Started",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimatedBusinessPhraseLeftAligned extends StatefulWidget {
  const AnimatedBusinessPhraseLeftAligned({Key? key}) : super(key: key);
  @override
  State<AnimatedBusinessPhraseLeftAligned> createState() =>
      _AnimatedBusinessPhraseLeftAlignedState();
}

class _AnimatedBusinessPhraseLeftAlignedState
    extends State<AnimatedBusinessPhraseLeftAligned> {
  final List<String> phrases = [
    "Dance Studio",
    "Fitness Centre",
    "Yoga Studio",
    "Wellness Center",
    "MMA & Boxing Hub",
    "Physiotherapy",
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % phrases.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 328,
          height: 48,
          child: Text(
            "Manage Your",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Container(
          width: 328,
          height: 54,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 800),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: Text(
              phrases[_currentIndex],
              key: ValueKey<String>(phrases[_currentIndex]),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        Container(
          width: 328,
          height: 48,
          child: Text(
            "with us!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}
