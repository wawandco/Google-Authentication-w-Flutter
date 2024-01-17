import 'package:flutter/material.dart';
import 'package:my_app/auth/widgets/google_sign_in_button_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Log In",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text(
            "By continuing, you agree to our User Agreement and acknowledge that you understand the Privacy Policy.",
            style: TextStyle(
              fontSize: 14,
              height: 1.2,
              color: Colors.black45,
            ),
          ),
        ),
        Center(
          child: GoogleSignInButton(
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
