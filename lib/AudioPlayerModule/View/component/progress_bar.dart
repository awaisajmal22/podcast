import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget progressBar(
    {required Duration progress,
    required Duration total,
    required Duration buffered,
    Function(Duration)? onSeek}) {
  return ProgressBar(
      progressBarColor: Colors.black,
      bufferedBarColor: Colors.black12,
      baseBarColor: Colors.black12,
      thumbColor: Colors.black,
      buffered: buffered,
      onSeek: onSeek as  Function(Duration),
      progress: progress,
      total: total);
}
