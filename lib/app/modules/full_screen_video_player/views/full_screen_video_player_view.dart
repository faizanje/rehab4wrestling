import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/constants/constants.dart';

import '../controllers/full_screen_video_player_controller.dart';

class FullScreenVideoPlayerView
    extends GetView<FullScreenVideoPlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FullScreenVideoPlayerView'),
        centerTitle: true,
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayerListVideoPlayer(
          BetterPlayerDataSource(BetterPlayerDataSourceType.network, kMediaURL),
          key: Key(kMediaURL.hashCode.toString()),
          autoPlay: true,
          configuration: BetterPlayerConfiguration(),
          // playFraction: 0.8,
        ),
      ),
    );
  }
}
