import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/constants/constants.dart';
import 'package:rehab4wrestling/utils/constant.dart';

import '../controllers/full_screen_video_player_controller.dart';

class FullScreenVideoPlayerView
    extends GetView<FullScreenVideoPlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/arrow-square-left.svg',
            color: Colors.grey,
          ),
          onPressed: (){
            Get.back();
          },
        ),

        title: const Text('Injury Name', style: TextStyle(color: Colors.black87,
            fontSize: 22,
            fontFamily: MyFont.fontModernist,
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayerListVideoPlayer(
              BetterPlayerDataSource(BetterPlayerDataSourceType.network, kMediaURL),
              key: Key(kMediaURL.hashCode.toString()),
              autoPlay: true,
              configuration: BetterPlayerConfiguration(),
              // playFraction: 0.8,
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 20),
            child: Text("Injury ", style: TextStyle(color: Colors.black87
                , fontSize: 26,
                fontFamily: MyFont.fontModernist,
                fontWeight: FontWeight.bold


            ),),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "This is the content!ksdjfl kjsdflk sjdflksjdf lskjfd lsdkfj  ls kfjlsfkjsdlfkjsfldkjsdflkjsfdlksjdflskdjf lksdjflskfjlsfkjslfkjsldfkjslfkjsldfkjsflksjflskjflskfjlsfkjslfkjsflksjflskfjlsfkjslfkjslfkjslfkjslfkjsldfkjsdf",
              style: TextStyle(color: Colors.black87,
                  fontFamily: MyFont.fontModernist,
                  fontSize: 16,
                  package: 'assets:fonts/Sk-Modernist-Regular'

              ),
            ),
          ),
        ],
      ),
    );
  }
}
