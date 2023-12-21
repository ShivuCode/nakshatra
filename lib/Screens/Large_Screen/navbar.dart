import 'package:flutter/material.dart';
import 'package:nakshatra/Screens/Large_Screen/pages/free.dart';
import 'package:nakshatra/Screens/Large_Screen/pages/home.dart';
import 'package:nakshatra/Screens/Large_Screen/pages/more.dart';
import 'package:nakshatra/Screens/Large_Screen/pages/premium.dart';
import 'package:nakshatra/Screens/Large_Screen/pages/sport.dart';

import '../../Constants/constants.dart';

// ignore: must_be_immutable
class Navbar extends StatefulWidget {
  int selected;
  Navbar({super.key, required this.selected});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              const Text.rich(TextSpan(
                  text: 'NA',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.teal,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "KSHA",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            letterSpacing: 0.3)),
                    TextSpan(
                        text: "TRA",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.teal,
                            letterSpacing: 0.3))
                  ])),
              width(10),
              Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.yellow.shade700)),
                    child: Text(
                      "Subscribe",
                      style:
                          TextStyle(color: Colors.yellow.shade700, fontSize: 6),
                    ),
                  ),
                  height(10)
                ],
              )
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => nextScreenReplace(context, const LargeScreen()),
              child: const Text(
                "Home",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1),
              ),
            ),
            height(6),
            if (widget.selected == 0)
              Container(width: 36, height: 2.5, color: Colors.teal)
          ],
        ),
        width(25),
        GestureDetector(
          onTap: () => nextScreenReplace(context, const SportTab()),
          child: Column(
            children: [
              const Text(
                "Sports",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1),
              ),
              height(6),
              if (widget.selected == 1)
                Container(width: 39, height: 2.5, color: Colors.teal)
            ],
          ),
        ),
        width(25),
        GestureDetector(
          onTap: () => nextScreenReplace(context, FreeTab()),
          child: Column(
            children: [
              const Text(
                "Free",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1),
              ),
              height(6),
              if (widget.selected == 2)
                Container(width: 26, height: 2.5, color: Colors.teal)
            ],
          ),
        ),
        width(25),
        GestureDetector(
          onTap: () => nextScreenReplace(context, PremiumTab()),
          child: Column(
            children: [
              const Text(
                "Premium",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1),
              ),
              height(6),
              if (widget.selected == 3)
                Container(width: 50, height: 2.5, color: Colors.teal)
            ],
          ),
        ),
        width(25),
        GestureDetector(
          onTap: () => nextScreenReplace(context, MoreTab()),
          child: Column(
            children: [
              const Text(
                "More..",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1),
              ),
              height(6),
              if (widget.selected == 4)
                Container(width: 40, height: 2.5, color: Colors.teal)
            ],
          ),
        ),
        width(25)
      ],
    );
  }
}
