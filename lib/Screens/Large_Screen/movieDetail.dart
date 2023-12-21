import 'package:flutter/material.dart';
import 'package:nakshatra/Constants/constants.dart';
import 'package:nakshatra/Screens/Large_Screen/movieTile.dart';
import 'package:nakshatra/video_player.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: double.infinity,
                height: size.height * 0.8,
                child: const VideoPlayerWidget()),
            height(20),
            const Text("Avengers: Endgame",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            height(5),
            const Text("Actors: Robert Downey Jr., Chris Evans, Mark Ruffalo"),
            height(5),
            const Text("Director: Anthony Russo, Joe Russo"),
            height(10),
            const Text.rich(TextSpan(
                text: "Discriptions : ",
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                      style: TextStyle(color: Colors.grey),
                      text:
                          "After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.")
                ])),
            height(15),
            const Text("Recommands",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Wrap(children: [
              MovieTile(
                iscomming: false,
                data: [],
              )
            ])
          ]),
        ),
      ),
    );
  }
}
