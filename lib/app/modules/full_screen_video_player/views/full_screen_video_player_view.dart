import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/constants/constants.dart';
import 'package:rehab4wrestling/utils/constant.dart';

import '../controllers/full_screen_video_player_controller.dart';

class FullScreenVideoPlayerView
    extends GetView<FullScreenVideoPlayerController> {
  const FullScreenVideoPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Rehab Video',
          style: TextStyle(
              color: Colors.black87, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayerListVideoPlayer(
              BetterPlayerDataSource(
                  BetterPlayerDataSourceType.network, kMediaURL),
              key: Key(kMediaURL.hashCode.toString()),
              autoPlay: true,
              configuration: BetterPlayerConfiguration(),
              // playFraction: 0.8,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Text(
              "Injury 1",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Lorem ipsum dolor sit amet. Ut accusamus magni id necessitatibus quasi nam repellat porro nam neque Quis in nulla voluptas qui omnis quidem? Qui voluptas minima sit unde facere et voluptatem facere. Vel architecto esse et doloribus quia est dolorum inventore et esse odio et voluptas voluptatem est commodi dolore.",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  package: 'assets:fonts/Sk-Modernist-Regular'),
            ),
          ),
        ],
      ),
    );
  }
}
