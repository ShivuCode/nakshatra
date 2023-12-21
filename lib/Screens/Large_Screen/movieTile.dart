import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nakshatra/Constants/constants.dart';
import 'package:nakshatra/Models/Movies.dart';
import 'package:nakshatra/Screens/Large_Screen/movieDetail.dart';

// ignore: must_be_immutable
class MovieTile extends StatelessWidget {
  bool iscomming = false;
  List<Movie> data;
  MovieTile({super.key, required this.iscomming, required this.data});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: List.generate(
            data.length,
            (index) => GestureDetector(
                  onTap: () => nextScreen(context, const MovieDetail()),
                  child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 200,
                              height: 230,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data[index].poster),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(1),
                                alignment: Alignment.center,
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.yellow.shade800),
                                child: const Text(
                                  "👑",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ))
                          ],
                        ),
                        Text(
                          data[index].title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 180,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(data[index].time.toString()),
                              Expanded(
                                  child: Text(
                                data[index].type,
                                style: const TextStyle(color: Colors.grey),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                    if (iscomming)
                      Positioned(
                        bottom: 70,
                        left: 30,
                        child: Row(
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                color: Colors.teal,
                                child: const Icon(
                                  FontAwesomeIcons.calendarDays,
                                  color: Colors.white,
                                )),
                            width(5),
                            Container(
                              width: 140,
                              height: 40,
                              color: Colors.teal,
                              alignment: Alignment.center,
                              child: Text(data[index].releasedDate.toString()),
                            )
                          ],
                        ),
                      )
                  ]),
                )));
  }
}
