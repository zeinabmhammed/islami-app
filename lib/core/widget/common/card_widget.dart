import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/resources/AppColors.dart';
import 'package:islami/core/resources/AppImages.dart';

class AudioCard extends StatefulWidget {
  final String title;
  final String url;

  const AudioCard({super.key, required this.title, required this.url});

  @override
  State<AudioCard> createState() => _AudioCardState();
}

class _AudioCardState extends State<AudioCard> {
  bool isPlaying = false;

  void _togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
    });

    // final player = AudioPlayer();
    // isPlaying ? player.play(UrlSource(widget.url)) : player.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2BE7F)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              isPlaying ? AppImages.wave : AppImages.radio,
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
              color: AppColors.black.withOpacity(0.5)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _togglePlay,
                      child: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                        color: AppColors.black,
                        size: 50,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.volume_up,
                      color: AppColors.black,
                      size: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
