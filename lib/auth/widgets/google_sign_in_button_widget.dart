import 'package:flutter/widgets.dart';
import 'package:my_app/auth/widgets/google_sign_in_button/google_sign_in_button.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return buildSignInButton(onPressed);
  }
}
