import 'dart:async';

import 'package:nakshatra/Constants/constants.dart';
import 'package:nakshatra/videoFullScreen.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _playerController;
  late Future<void> _initializeVideoPlayer;
  String startTime = '00:01';
  Timer? sliderTime;
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
    sliderTime = Timer.periodic(const Duration(milliseconds: 200), (_) {
      if (_playerController.value.isPlaying) {
        setState(() {
          // Update the slider value with the current video position
          Duration time = _playerController.value.position;
          startTime = getDurationString(time);
        });
      }
    });
  }

  @override
  void initState() {
    _playerController = VideoPlayerController.asset("assets/Avatar.mp4");

    _initializeVideoPlayer = _playerController.initialize().then((value) {
      _playerController.play();
      setState(() {});
    });
    slider();

    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Center(
                child: SizedBox(
                  width: size * 0.6,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _playerController.value.isBuffering
                          ? AspectRatio(
                              aspectRatio: _playerController.value.aspectRatio,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.teal,
                                ),
                              ),
                            )
                          : AspectRatio(
                              aspectRatio: _playerController.value.aspectRatio,
                              child: Stack(
                                children: [
                                  VideoPlayer(_playerController),
                                  Center(
                                    child: IconButton(
                                      color: Colors.white,
                                      splashColor: Colors.white,
                                      splashRadius: 30,
                                      highlightColor: Colors.white,
                                      icon: Icon(
                                          !_playerController.value.isPlaying
                                              ? Icons.play_arrow
                                              : Icons.pause),
                                      onPressed: () {
                                        if (_playerController.value.isPlaying) {
                                          setState(() {
                                            _playerController.pause();
                                          });
                                        } else {
                                          setState(() {
                                            _playerController.play();
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
                                        onPressed: () {
                                          nextScreen(
                                              context,
                                              FullScreen(
                                                  endTime: getDurationString(
                                                      Duration(
                                                          seconds:
                                                              _playerController
                                                                  .value
                                                                  .duration
                                                                  .inSeconds
                                                                  .toDouble()
                                                                  .toInt())),
                                                  startTime: startTime,
                                                  sliderTime: sliderTime,
                                                  playerController:
                                                      _playerController));
                                        },
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
                            startTime,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Expanded(
                            child: Slider(
                              value: _playerController.value.position.inSeconds
                                  .toDouble(),
                              min: 0.0,
                              max: _playerController.value.duration.inSeconds
                                  .toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  final Duration newPosition =
                                      Duration(seconds: value.toInt());

                                  _playerController.seekTo(newPosition);
                                });
                              },
                            ),
                          ),
                          Text(getDurationString(Duration(
                              seconds: _playerController
                                  .value.duration.inSeconds
                                  .toDouble()
                                  .toInt()))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.teal,
            ));
          }
        });
  }
}
