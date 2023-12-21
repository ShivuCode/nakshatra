import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nakshatra/Constants/constants.dart';
import 'package:nakshatra/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  Timer? timer;
  final trending = [
    "https://4.bp.blogspot.com/-rw8a0tgQDuE/Vrvgeuq97EI/AAAAAAAAAIc/yN3mlj17T70/s1600/avatar-poster-wallpaper-3.jpg",
    "https://1.bp.blogspot.com/-cvLO8DsUOTg/XnMufTWWy5I/AAAAAAAAAQM/o51AF1KASi4Bq8ySTqkbVUnmr4yH9FPOgCLcBGAsYHQ/s1600/maxresdefault.jpg",
    "https://th.bing.com/th/id/OIP.3cNVFTJ8brlrs13rG5H5zgHaEK?w=286&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",
    "https://www.hdnicewallpapers.com/Walls/Big/Hrithik%20Roshan/Hrithik_Roshan_in_Movie_Agneepath.jpg",
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

  @override
  void initState() {
    slide();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 8),
            height: 260,
            alignment: Alignment.bottomCenter,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
                image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.colorBurn),
              image: NetworkImage(trending[index]),
              fit: BoxFit.cover,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                trending.length,
                (i) => Row(
                  children: [
                    Icon(
                      index == i ? Icons.lens : FontAwesomeIcons.circle,
                      color: Colors.white,
                      size: index == i ? 8 : 7,
                    ),
                    width(5)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                height(10),
                const Text("Hot Right Now"),
                height(6),
                Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(trending[2]),
                              fit: BoxFit.cover,
                            ))),
                    Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: 35,
                      height: 15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.lens, color: Colors.red, size: 6),
                            width(3),
                            const Text(
                              "Live",
                              style: TextStyle(fontSize: 8),
                            )
                          ]),
                    )
                  ],
                ),
                height(10),
                const Text("Trending In India"),
                height(6),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => Stack(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    nextScreen(context,const  VideoPlayerWidget()),
                                child: Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              covers[i]["imageCover"]),
                                          fit: BoxFit.cover,
                                        ))),
                              ),
                              i != 1 ? premium() : const Center()
                            ],
                          ),
                      separatorBuilder: (_, i) => width(10),
                      itemCount: covers.length),
                ),
                height(10),
                const Text("Popular Hollywood Shows"),
                height(6),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => Stack(
                            children: [
                              Container(
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            covers[0]["imageCover"]),
                                        fit: BoxFit.cover,
                                      ))),
                              premium()
                            ],
                          ),
                      separatorBuilder: (_, i) => width(10),
                      itemCount: 1),
                ),
                height(10),
                const Text("Popular Bollywood Shows"),
                height(6),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => Stack(
                            children: [
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            covers[i + 1]["imageCover"]),
                                        fit: BoxFit.cover,
                                      ))),
                              i != 0 ? premium() : const Center()
                            ],
                          ),
                      separatorBuilder: (_, i) => width(10),
                      itemCount: covers.length - 1),
                ),
                height(6),
                const Text(
                  "Movies",
                  style: TextStyle(fontSize: 16),
                ),
                height(6),
                Center(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(
                      covers.length,
                      (index) => SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: MediaQuery.of(context).size.width * .36,
                        child: Stack(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          covers[index]["imageCover"]),
                                      fit: BoxFit.cover,
                                    ))),
                            index != 1 ? premium() : const Center()
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
