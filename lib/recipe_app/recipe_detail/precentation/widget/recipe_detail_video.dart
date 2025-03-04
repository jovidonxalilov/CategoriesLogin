import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class RecipeDetailVideo extends StatefulWidget {
  const RecipeDetailVideo({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<RecipeDetailVideo> createState() => _RecipeDetailVideoState();
}

class _RecipeDetailVideoState extends State<RecipeDetailVideo> {
  late final VideoPlayerController controller;
  bool showSkipOverlay = false;
  String skipText = '';
  bool showPauseIcon = false;
  double volume = 1.0;
  bool isFullScreen = true;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          controller.play();
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  void skipForward() {
    final newPosition = controller.value.position + const Duration(seconds: 15);
    controller.seekTo(newPosition);
    showSkipMessage("+15s");
  }

  void skipBackward() {
    final newPosition = controller.value.position - const Duration(seconds: 15);
    controller.seekTo(newPosition);
    showSkipMessage("-15s");
  }

  void showSkipMessage(String text) {
    setState(() {
      skipText = text;
      showSkipOverlay = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        showSkipOverlay = false;
      });
    });
  }

  void togglePause() {
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();
        showPauseIcon = true;
      } else {
        controller.play();
        showPauseIcon = false;
      }
    });
  }

  void toggleFullScreen() {
    setState(() {
      isFullScreen = !isFullScreen;
      if (isFullScreen) {
        SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft],
        );
      } else {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      }
    });
  }

  String formatDuration(Duration position) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(position.inMinutes.remainder(60));
    final seconds = twoDigits(position.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: isFullScreen ? controller.value.aspectRatio : 16 / 9,
          child: GestureDetector(
            onTap: togglePause,
            onDoubleTapDown: (details) {
              final screenWidth = MediaQuery.of(context).size.width;
              if (details.globalPosition.dx < screenWidth / 2) {
                skipBackward();
              } else {
                skipForward();
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                VideoPlayer(controller),
                if (showSkipOverlay)
                  Positioned(
                    top: 80,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        skipText,
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                if (showPauseIcon)
                  const Icon(
                    Icons.pause_circle_filled,
                    color: Colors.white,
                    size: 80,
                  ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTapDown: (details) {
                          final width = MediaQuery.of(context).size.width;
                          final tapPosition = details.localPosition.dx;
                          final duration = controller.value.duration;
                          final newPosition = Duration(
                            milliseconds: (duration.inMilliseconds * (tapPosition / width)).toInt(),
                          );
                          controller.seekTo(newPosition);
                        },
                        child: VideoProgressIndicator(
                          controller,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                            playedColor: Colors.red,
                            bufferedColor: Colors.white54,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: controller,
                            builder: (context, VideoPlayerValue value, child) {
                              return Text(
                                formatDuration(value.position),
                                style: const TextStyle(color: Colors.white),
                              );
                            },
                          ),
                          Text(
                            formatDuration(controller.value.duration),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              isFullScreen ? Icons.fullscreen_exit_outlined : Icons.fullscreen,
                              color: Colors.white,
                            ),
                            onPressed: toggleFullScreen,
                          ),
                          Slider(
                            value: volume,
                            min: 0,
                            max: 1,
                            onChanged: (value) {
                              setState(() {
                                volume = value;
                                controller.setVolume(volume);
                              });
                            },
                            onChangeStart: (_) {},
                          ),
                          const Icon(Icons.volume_up, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
