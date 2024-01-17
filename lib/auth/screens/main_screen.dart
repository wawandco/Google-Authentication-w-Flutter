import 'package:flutter/material.dart';
import 'package:my_app/auth/widgets/header_menu_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Header(),
            ],
          ),
        ),
      ),
    );
  }
}
