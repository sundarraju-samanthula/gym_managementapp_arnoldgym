import 'package:flutter/material.dart';

class LoginBottomSheet extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onLinkedInTap;
  final VoidCallback onFacebookTap;

  const LoginBottomSheet({
    super.key,
    required this.onGoogleTap,
    required this.onLinkedInTap,
    required this.onFacebookTap,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.42,
      minChildSize: 0.42,
      maxChildSize: 0.42,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 46, 62, 80),
                Color.fromARGB(190, 64, 97, 136),
              ],
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(26)),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              const SizedBox(height: 20),

              Text("Hi there!", style: Theme.of(context).textTheme.bodyLarge),

              const SizedBox(height: 8),

              // Subtitle
              Text(
                "Sign in to keep things running smoothly.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 24),

              // Google button
              _socialButton(
                iconPath: "assets/google.png",
                text: "Continue with Google",
                onTap: onGoogleTap,
              ),

              const SizedBox(height: 16),

              // LinkedIn button
              _socialButton(
                iconPath: "assets/linkedin.png",
                text: "Continue with LinkedIn",
                onTap: onLinkedInTap,
              ),

              const SizedBox(height: 16),

              // Facebook button
              _socialButton(
                iconPath: "assets/facebook.jpeg",
                text: "Continue with Facebook",
                onTap: onFacebookTap,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _socialButton({
    required String iconPath,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white24, // semi-transparent background
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, height: 22),
            const SizedBox(width: 14),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
