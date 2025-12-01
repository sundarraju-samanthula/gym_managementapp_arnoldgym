import 'dart:ui';
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
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(26)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(85, 166, 196, 0.25),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(26),
                ),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),

              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Hi there!",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'BarlowSemiCondensed',
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Sign in to keep things running smoothly.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),

                    const SizedBox(height: 10),

                    Divider(
                      color: Colors.white.withOpacity(0.7),
                      thickness: 1.5,
                    ),

                    const SizedBox(height: 22),

                    _socialButton(
                      iconPath: "assets/google.png",
                      text: "Continue with Google",
                      onTap: onGoogleTap,
                    ),

                    const SizedBox(height: 16),

                    _socialButton(
                      iconPath: "assets/linkedin.png",
                      text: "Continue with LinkedIn",
                      onTap: onLinkedInTap,
                    ),

                    const SizedBox(height: 16),

                    _socialButton(
                      iconPath: "assets/facebook.jpeg",
                      text: "Continue with Facebook",
                      onTap: onFacebookTap,
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
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
          color: const Color.fromRGBO(47, 91, 108, 1),
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
