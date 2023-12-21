
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nakshatra/Constants/constants.dart';
import 'package:nakshatra/Screens/Mediam_Screen/free.dart';
import 'package:nakshatra/Screens/Mediam_Screen/home.dart';
import 'package:nakshatra/Screens/Mediam_Screen/more.dart';
import 'package:nakshatra/Screens/Mediam_Screen/premium.dart';
import 'package:nakshatra/Screens/Mediam_Screen/sports.dart';
import 'package:nakshatra/Screens/notification.dart';

class MediamScreen extends StatefulWidget {
  const MediamScreen({super.key});

  @override
  State<MediamScreen> createState() => _MediamScreenState();
}

class _MediamScreenState extends State<MediamScreen> {
  int currentPos = 0;
  List page = const [Home(), Sports(), Free(), Premium(), More()];

  @override
  void initState() {
    MyNotification.showNotification('Welcome !',
        "Welcome to our nakshatra movie streaming app which provide you lots of movies, websires etc. \nI hope you liked");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Text.rich(TextSpan(
                text: 'NA',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.teal,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: "KSHA",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          letterSpacing: 0.3)),
                  TextSpan(
                      text: "TRA",
                      style: TextStyle(
                          fontSize: 16, color: Colors.teal, letterSpacing: 0.3))
                ])),
            width(10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.yellow.shade700)),
              child: Text(
                "Subscribe",
                style: TextStyle(color: Colors.yellow.shade700, fontSize: 6),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            splashColor: Colors.transparent,
            iconSize: 14,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPos,
          onTap: (value) => setState(() {
                currentPos = value;
              }),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 12,
          selectedFontSize: 8,
          unselectedLabelStyle: const TextStyle(fontSize: 8),
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.white,
          items: const [
           
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home), label: "For You"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.running), label: "Sports"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.play), label: "Free"),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_outlined), label: "Premium"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bars), label: "For You"),
          ]),
      body: page[currentPos],
    );
  }
}
