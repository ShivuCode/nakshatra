import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nakshatra/Constants/constants.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class FullScreen extends StatefulWidget {
  String startTime;
  String endTime;
  Timer? sliderTime;
  VideoPlayerController playerController;
  FullScreen(
      {super.key,
      required this.sliderTime,
      required this.startTime,
      required this.endTime,
      required this.playerController});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  double speed = 1;

  String getDurationString(Duration duration) {
    // Convert the duration to hours, minutes, and seconds format
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours == 0) {
      return '$twoDigitMinutes:$twoDigitSeconds';
    } else {
      String twoDigitHours = twoDigits(duration.inHours);
      return '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
    }
  }

  slider() {
    widget.sliderTime = Timer.periodic(const Duration(milliseconds: 200), (_) {
      if (widget.playerController.value.isPlaying) {
        setState(() {
          // Update the slider value with the current video position
          Duration time = widget.playerController.value.position;
          widget.startTime = getDurationString(time);
        });
      }
    });
  }

  @override
  void initState() {
    slider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.playerController.value.isBuffering
                  ? AspectRatio(
                      aspectRatio: widget.playerController.value.aspectRatio,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      ),
                    )
                  : AspectRatio(
                      aspectRatio: widget.playerController.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(widget.playerController),
                          Center(
                            child: IconButton(
                              color: Colors.white,
                              splashColor: Colors.white,
                              splashRadius: 30,
                              highlightColor: Colors.white,
                              icon: Icon(
                                  !widget.playerController.value.isPlaying
                                      ? Icons.play_arrow
                                      : Icons.pause),
                              onPressed: () {
                                if (widget.playerController.value.isPlaying) {
                                  setState(() {
                                    widget.playerController.pause();
                                  });
                                } else {
                                  setState(() {
                                    widget.playerController.play();
                                  });
                                }
                              },
                            ),
                          ),
                          Positioned(
                              bottom: 2,
                              right: 2,
                              child: IconButton(
                                splashRadius: 1,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.center_focus_strong_outlined,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
              Row(
                children: [
                  Text(
                    widget.startTime,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Slider(
                      value: widget.playerController.value.position.inSeconds
                          .toDouble(),
                      min: 0.0,
                      max: widget.playerController.value.duration.inSeconds
                          .toDouble(),
                      onChanged: (value) {
                        setState(() {
                          final Duration newPosition =
                              Duration(seconds: value.toInt());

                          widget.playerController.seekTo(newPosition);
                        });
                      },
                    ),
                  ),
                  Text(getDurationString(Duration(
                      seconds: widget.playerController.value.duration.inSeconds
                          .toDouble()
                          .toInt()))),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  content: Container(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              const Text("Speed:"),
                                              width(10),
                                              DropdownButton(
                                                  value: speed,
                                                  items: const [
                                                    DropdownMenuItem(
                                                        value: 0.25,
                                                        child: Text("0.25")),
                                                    DropdownMenuItem(
                                                        value: 0.25,
                                                        child: Text("0.5")),
                                                    DropdownMenuItem(
                                                        value: 0.75,
                                                        child: Text("0.75")),
                                                    DropdownMenuItem(
                                                        value: 1.0,
                                                        child: Text("1")),
                                                    DropdownMenuItem(
                                                        value: 1.25,
                                                        child: Text("1.25")),
                                                    DropdownMenuItem(
                                                        value: 1.5,
                                                        child: Text("1.5")),
                                                    DropdownMenuItem(
                                                        value: 1.75,
                                                        child: Text("1.75")),
                                                    DropdownMenuItem(
                                                        value: 2.0,
                                                        child: Text("2")),
                                                  ],
                                                  onChanged: (v) =>
                                                      setState(() {
                                                        speed = v!;
                                                        widget.playerController
                                                            .setPlaybackSpeed(
                                                                speed);
                                                      })),
                                            ],
                                          )
                                        ]),
                                  ),
                                ));
                      },
                      splashRadius: 1,
                      icon: const Icon(Icons.settings))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
