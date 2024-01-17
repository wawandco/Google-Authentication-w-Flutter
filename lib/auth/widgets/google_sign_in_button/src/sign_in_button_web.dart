import 'package:flutter/widgets.dart';
import 'package:google_sign_in_web/web_only.dart';

Widget buildSignInButton(VoidCallback? onPressed) {
  return renderButton(
    configuration: GSIButtonConfiguration(
      text: GSIButtonText.continueWith,
      theme: GSIButtonTheme.filledBlack,
      shape: GSIButtonShape.pill,
      minimumWidth: 300,
      locale: "en-US",
    ),
  );
}
