import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/utils/radio_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radio_player/radio_player.dart';

class LiveStreamButton extends StatefulWidget {
  const LiveStreamButton({super.key});

  @override
  State<LiveStreamButton> createState() => _LiveStreamButtonState();
}

class _LiveStreamButtonState extends State<LiveStreamButton> {
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    RadioService.stateStream.listen((PlaybackState state) {
      if (!mounted) return;
      setState(() => _isPlaying = state == PlaybackState.playing);
    });
  }

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await RadioService.pause();
    } else {
      await RadioService.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: Kolors.kPrimaryLight,
          borderRadius: BorderRadius.circular(50),
          boxShadow: _isPlaying
              ? [
                  BoxShadow(
                    color: Kolors.kPrimary.withOpacity(0.6),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Icon(
          _isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
          color: Kolors.kWhite,
          size: 20,
        ),
      ),
    );
  }
}
