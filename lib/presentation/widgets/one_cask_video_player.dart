import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
 class OneCaskVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final double? height;
  final double? width;

  const OneCaskVideoPlayer({
    super.key,
    required this.videoUrl,
    this.height,
    this.width,
  });

  @override
  State<OneCaskVideoPlayer> createState() => _OneCaskVideoPlayerState();
}

class _OneCaskVideoPlayerState extends State<OneCaskVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      }).catchError((error) {
        // Handle initialization errors
        log('Error initializing video: $error');
      });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: SizedBox(
                      height: widget.height,
                      width: widget.width,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  IconButton(
                    iconSize: 56,
                    icon: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    onPressed: _togglePlayPause,
                  ),
                ],
              ),
              VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ],
          )
        : Center(
            child: Icon(
              Icons.play_circle_fill,
              size: 56,
              color: Colors.white.withOpacity(0.8),
            ),
          );
  }
}