import 'package:flutter/material.dart';

import '../navbar.dart';
// ignore: must_be_immutable
class PremiumTab extends StatelessWidget {
 PremiumTab({super.key});

  int selected = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.colorBurn),
                    onError: (exception, stackTrace) {},
                    image: const NetworkImage("assets/sport.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Navbar(selected: selected),
              ],
            ),
          ),
        ],
      ),
    );
  }
}