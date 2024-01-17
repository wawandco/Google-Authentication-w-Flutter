import 'package:flutter/material.dart';

Widget buildSignInButton(VoidCallback? onPressed) {
  return Expanded(
    child: Column(
      children: [
        TextButton(
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 24,
              )),
              backgroundColor: MaterialStatePropertyAll(
                Colors.black,
              ),
              shape: MaterialStatePropertyAll(
                StadiumBorder(),
              ),
            ),
            onPressed: onPressed,
            child: const Row(
              children: [
                Text(
                  "G",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Continue With Google",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}
