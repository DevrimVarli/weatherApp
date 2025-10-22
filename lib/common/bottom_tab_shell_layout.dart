
import 'package:flutter/material.dart';
import 'package:weather_app/common/bottom_app_navigation.dart';

class BottomTabShellLayout extends StatelessWidget {
  const BottomTabShellLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const BottomAppNavigationBar(),
    );
  }
}
