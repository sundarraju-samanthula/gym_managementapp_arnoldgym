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
            color: Color.fromRGBO(85, 166, 196, 0.3),

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

              Text(
                "Hi there!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),

              Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    "Log In and Take Charge",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  // Subtitle
                  Text(
                    "Sign in to keep things running smoothly.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
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
          color: Color.fromRGBO(47, 91, 108, 1),
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
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
