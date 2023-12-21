import 'package:flutter/material.dart';
import 'package:nakshatra/Screens/Large_Screen/pages/home.dart';


import 'package:nakshatra/Screens/Mediam_Screen/root.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({super.key});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.maxWidth < 800) {
        return const MediamScreen();
      } else {
        return const LargeScreen();
      }
    });
  }
}
