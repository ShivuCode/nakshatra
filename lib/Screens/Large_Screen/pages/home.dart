import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:nakshatra/Constants/constants.dart';
import 'package:nakshatra/Models/Movies.dart';
import 'package:nakshatra/Services/api.dart';
import 'package:nakshatra/Screens/Large_Screen/movieTile.dart';
import 'package:nakshatra/Screens/Large_Screen/navbar.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({super.key});

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  int index = 0;
  int selected = 0;
  int selectedButton = 0;
  Timer? timer;
  List<Movie> movies = [];
  final trending = [
    {'image': "assets/cover.jpg", 'title': "venom"},
    {'image': "assets/cover2.jpg", 'title': "After earth"},
    {'image': "assets/cover3.jpg", 'title': "Dark Side"},
    {'image': "assets/cover4.jpg", 'title': "Avatar"},
  ];
  void slide() {
    timer = Timer(const Duration(seconds: 2), () {
      if (index >= trending.length - 1) {
        setState(() {
          index = 0;
        });
      } else {
        setState(() {
          index++;
        });
      }
      slide();
    });
  }

  fetchData() async {
    print("time to call api");
    await ApiService.login('shivani', '123456');
    final data = await ApiService.fetchMovies();
    if (data.isNotEmpty) {
      // print(data);
      print("----------");
      movies.addAll(data.map((json) => Movie.fromJson(json)).toList());
    }
  }

  @override
  void initState() {
    fetchData();
    slide();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                alignment: Alignment.bottomLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            background.withOpacity(0.6), BlendMode.colorBurn),
                        onError: (exception, stackTrace) {},
                        image: AssetImage(trending[index]["image"].toString()),
                        fit: BoxFit.cover)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Navbar(selected: selected)),
                      height(size.height * 0.43),
                      Text(trending[index]["title"].toString().toUpperCase(),
                          style: const TextStyle(
                              fontSize: 100, fontWeight: FontWeight.bold)),
                      height(20),
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.teal),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(150, 45))),
                                child: const Text("Book Now")),
                            width(10),
                            const Text("JULY 06, 2023\nIMAX 3D")
                          ],
                        ),
                      ),
                      height(80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Row(children: [
                              width(5),
                              const Icon(FontAwesomeIcons.facebook),
                              width(5),
                              const Icon(FontAwesomeIcons.whatsapp),
                              width(5),
                              const Icon(FontAwesomeIcons.instagram),
                            ]),
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            height: 40,
                            child: TextField(
                                cursorColor: Colors.teal,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.5),
                                    prefixIcon: const Icon(
                                      CupertinoIcons.search,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(8)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(8)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(8)))),
                          ),
                        ],
                      ),
                      height(10),
                      title("OPENING...   ")
                    ]),
              ),
              //Buttons for see movies
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: PreferredSize(
                    preferredSize: const Size(double.infinity, 60),
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          button("All Film", 0),
                          width(10),
                          button("Webseries", 1),
                          width(10),
                          button("Tv Shows", 2),
                          width(10),
                          button("Anime", 3),
                          width(10),
                          button("Cartons", 4),
                        ],
                      ),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 40, left: 20, right: 20),
                color: background,
                child: Center(
                    child: MovieTile(
                  data: movies,
                  iscomming: false,
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        const Positioned(
                            right: 0,
                            top: 0.1,
                            child: CircleAvatar(
                              minRadius: 5,
                              backgroundColor: Colors.teal,
                            )),
                        height(10),
                        const Text("COMMING SOON...   "),
                      ],
                    ),
                    height(5),
                    colorLine(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: MovieTile(
                        data: movies,
                        iscomming: true,
                      ),
                    ),
                    height(10),
                    Column(
                      children: [
                        height(30),
                        Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.grey,
                                ),
                                width(5),
                                const Icon(FontAwesomeIcons.whatsapp,
                                    color: Colors.grey),
                                width(5),
                                const Icon(FontAwesomeIcons.instagram,
                                    color: Colors.grey),
                                width(5),
                                const Icon(FontAwesomeIcons.twitter,
                                    color: Colors.grey),
                              ],
                            )),
                        height(size.height * 0.15),
                        const Row(
                          children: [
                            Expanded(child: Center()),
                            Expanded(
                                child: Column(
                              children: [
                                Text("pbind4545@gmail.com",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                Text("+91 8347232980",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ],
                            )),
                            Expanded(
                                child: Text(
                              "@nakshatra cinema all right reserved",
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 10),
                            ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  button(String name, i) => ElevatedButton(
      onPressed: () {
        setState(() {
          selectedButton = i;
        });
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              selectedButton == i ? Colors.teal : Colors.grey.shade900),
          minimumSize: MaterialStateProperty.all(const Size(120, 40))),
      child: Text(name));
}
