import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nakshatra/Constants/constants.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
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
        mainAxisSize: MainAxisSize.min,
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  height(10),
                  const Text("Hot Movies"),
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
                                              covers[i]["imageCover"]),
                                          fit: BoxFit.cover,
                                        ))),
                                premium()
                              ],
                            ),
                        separatorBuilder: (_, i) => width(10),
                        itemCount: covers.length),
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
                                Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              covers[i]["imageCover"]),
                                          fit: BoxFit.cover,
                                        ))),
                                premium()
                              ],
                            ),
                        separatorBuilder: (_, i) => width(10),
                        itemCount: covers.length),
                  ),
                  height(10),
                  const Text("Websires"),
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
                                              covers[i]["imageCover"]),
                                          fit: BoxFit.cover,
                                        ))),
                                premium()
                              ],
                            ),
                        separatorBuilder: (_, i) => width(10),
                        itemCount: covers.length),
                  ),
                  height(10),
                  const Text("K-drama"),
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
                                              covers[i]["imageCover"]),
                                          fit: BoxFit.cover,
                                        ))),
                                premium()
                              ],
                            ),
                        separatorBuilder: (_, i) => width(10),
                        itemCount: covers.length),
                  ),
                  height(10),
                  const Text("Action Movie"),
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
                                              covers[i]["imageCover"]),
                                          fit: BoxFit.cover,
                                        ))),
                                premium()
                              ],
                            ),
                        separatorBuilder: (_, i) => width(10),
                        itemCount: covers.length),
                  ),
                  height(10),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          onError: (exception, stackTrace) {},
                          image: const NetworkImage(
                              "https://th.bing.com/th/id/OIP.HtV8C3H5nUhBa5UVeGojWQHaEK?pid=ImgDet&rs=1"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  height(10),
                  const Text("Romance Movie"),
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
                                              covers[i]["imageCover"]),
                                          fit: BoxFit.cover,
                                        ))),
                                premium()
                              ],
                            ),
                        separatorBuilder: (_, i) => width(10),
                        itemCount: covers.length),
                  ),
                  height(10),
                  const Text("Tv Shows"),
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
                                              covers[i]["imageCover"]),
                                          fit: BoxFit.cover,
                                        ))),
                                premium()
                              ],
                            ),
                        separatorBuilder: (_, i) => width(10),
                        itemCount: covers.length),
                  ),
                  height(10),
                  const Text("Live Shows"),
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
                                              covers[i]["imageCover"]),
                                          fit: BoxFit.cover,
                                        ))),
                                premium()
                              ],
                            ),
                        separatorBuilder: (_, i) => width(10),
                        itemCount: covers.length),
                  ),
                  height(10),
                ]),
          ),
        ],
      ),
    );
  }
}
