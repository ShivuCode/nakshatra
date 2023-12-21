import 'package:flutter/material.dart';

Color background = Colors.black.withOpacity(0.95);

Widget height(double h) => SizedBox(height: h);
Widget width(double w) => SizedBox(width: w);

nextScreenReplace(context, page) =>
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));

nextScreen(context, page) =>
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));

premium() => Container(
    padding: const EdgeInsets.all(1),
    alignment: Alignment.center,
    width: 15,
    height: 15,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.yellow.shade800),
    child: const Text(
      "👑",
      style: TextStyle(color: Colors.black, fontSize: 8),
    ));

colorLine() => Container(
      height: 2,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.teal, Colors.black])),
    );

title(text) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          Text(text),
        ],
      ),
      height(5),
      colorLine()
    ]);

List covers = [
  {
    "imageCover":
        "https://th.bing.com/th/id/OIP.lsyx5H7-NVMaVV81D1pYdQAAAA?pid=ImgDet&rs=1",
    "title": "Avatar"
  },
  {
    "imageCover":
        "https://th.bing.com/th/id/OIP.imsJT9VARucrmc-EllxCdQAAAA?pid=ImgDet&rs=1",
    "title": "Tu Jhoothi Mai Makkar"
  },
  {
    "imageCover":
        "https://th.bing.com/th/id/OIP.jTB8Qoxlnju6RvDnJ7XKGAHaLH?pid=ImgDet&rs=1",
    "title": "RRR"
  },
  {
    "imageCover":
        "https://www.filmibeat.com/ph-big/2020/08/adipurush_15977207741.jpg",
    "title": "Adipurush"
  },
  {
    "imageCover":
        "https://m.media-amazon.com/images/M/MV5BMjI3NTk4MTgyMV5BMl5BanBnXkFtZTgwMTA4NzgzMTE@._V1_UY1200_CR136,0,630,1200_AL_.jpg",
    "title": "Wednesday"
  },
  {
    "imageCover":
        "https://assets-in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/the-kerala-story-et00343918-1667547213.jpg",
    "title": "The Kerala Story"
  },
  {
    "imageCover":
        "https://m.media-amazon.com/images/M/MV5BODI5MzQ2NDg0MV5BMl5BanBnXkFtZTcwNTEwMzI1OQ@@._V1_FMjpg_UX1000_.jpg",
    "title": "Fukery Return"
  }
];
