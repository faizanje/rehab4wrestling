import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/models/MyVideo.dart';
import 'package:rehab4wrestling/app/data/models/args/FullScreenVideoArgs.dart';

class FullScreenVideoPlayerController extends GetxController {
  late final FullScreenVideoArgs args;
  late final MyVideo video;
  late final videoPlayerController = BetterPlayerController(
    const BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      autoPlay: true,
      fullScreenAspectRatio: 16 / 9,
      fit: BoxFit.contain,
      controlsConfiguration: BetterPlayerControlsConfiguration(
        enableQualities: false,
        enableAudioTracks: false,
        enableSubtitles: false,
        controlBarColor: Colors.black26,
      ),
    ),
  );
  late BetterPlayerDataSource betterPlayerDataSource;

  @override
  void onInit() {
    args = Get.arguments;
    video = args.video;
    final url = video.url;
    // url =
    //     "https://onedrive.live.com/download?cid=4A9CA65335913795&resid=4A9CA65335913795%212016&authkey=AMr7uOo_sH4R69k";
    betterPlayerDataSource = BetterPlayerDataSource.network(
      url,
      cacheConfiguration: BetterPlayerCacheConfiguration(
        useCache: true,
        preCacheSize: 10 * 1024 * 1024,
        maxCacheSize: 10 * 1024 * 1024,
        maxCacheFileSize: 10 * 1024 * 1024,

        ///Android only option to use cached video between app sessions
        key: url.hashCode.toString(),
      ),
    );
    super.onInit();

    videoPlayerController.setupDataSource(betterPlayerDataSource);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoPlayerController.dispose(forceDispose: true);
    super.onClose();
  }
}
