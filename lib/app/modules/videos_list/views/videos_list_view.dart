import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/constants/constants.dart';
import 'package:rehab4wrestling/app/data/models/MyVideo.dart';
import 'package:rehab4wrestling/app/data/models/TabItem.dart';
import 'package:rehab4wrestling/app/data/models/WrestlingDataItem.dart';
import 'package:rehab4wrestling/app/data/models/args/FullScreenVideoArgs.dart';
import 'package:rehab4wrestling/app/modules/home/controllers/home_controller.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/packages/human_body_selector/svg_painter/constant.dart';
import 'package:rehab4wrestling/themes/app_theme.dart';
import 'package:rehab4wrestling/utils/constant.dart';

import '../controllers/videos_list_controller.dart';

class VideosListView extends GetView<VideosListController> {
  VideosListView({Key? key}) : super(key: key);
  final homeController = HomeController.instance;
  final tabs = [
    TabItemV2(
      page: RehabVideosList(),
      title: 'Rehab',
    ),
    TabItemV2(
      page: WrestlingVideosList(),
      title: 'Wrestling',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Videos list',
          style: TextStyle(
              color: Colors.black87, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: homeController.obx(
        (data) {
          return _buildBody();
        },
      ),
    );
  }

  Widget _buildBody() {
    // final wrestlingDataItems =
    // homeController.wrestlingDataItemsMapObs[controller.bodyPartKey]!;
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 45,
            decoration: BoxDecoration(
              // color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                kCornerRadius,
              ),
              color: MyColor.yellowColor.withOpacity(0.1),
            ),
            child: TabBar(
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  kCornerRadius,
                ),
                // color: MyColors.blue_100.withOpacity(0.5),
                color: MyColor.yellowColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: tabs
                  .map(
                    (e) => Tab(
                      text: e.title,
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: tabs.map((e) => e.page).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class RehabVideosList extends StatelessWidget {
  RehabVideosList({Key? key}) : super(key: key);

  final controller = VideosListController.instance;

  @override
  Widget build(BuildContext context) {
    final videos = controller.wrestlingDataItemData.videos.rehab;
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final video = videos[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Theme(
                data: MyThemes().themeData.copyWith(
                      dividerColor: Colors.transparent,
                      // textTheme: Get.textTheme.copyWith(),
                    ),
                child: ListTile(
                  onTap: () {
                    Get.toNamed(
                      Routes.FULL_SCREEN_VIDEO_PLAYER,
                      arguments: FullScreenVideoArgs(
                          video: MyVideo(name: video.name, url: video.link),
                          injuries: controller.args.injury),
                    );
                  },
                  leading: const Icon(
                    Icons.movie,
                  ),
                  trailing: const Icon(
                    Icons.play_circle,
                    color: MyColor.yellowColor,
                  ),
                  // backgroundColor: Colors.white,
                  // collapsedBackgroundColor: Colors.white,
                  title: Text(
                    video.name,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: videos.length,
      ),
    );
  }
}

class WrestlingVideosList extends StatelessWidget {
  WrestlingVideosList({Key? key}) : super(key: key);

  final controller = VideosListController.instance;

  @override
  Widget build(BuildContext context) {
    final videos = controller.wrestlingDataItemData.videos.wrestling;
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final video = videos[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Theme(
                data: MyThemes().themeData.copyWith(
                      dividerColor: Colors.transparent,
                      // textTheme: Get.textTheme.copyWith(),
                    ),
                child: ListTile(
                  onTap: () {
                    Get.toNamed(
                      Routes.FULL_SCREEN_VIDEO_PLAYER,
                      arguments: FullScreenVideoArgs(
                          video: MyVideo(name: video.name, url: video.link),
                          injuries: controller.args.injury),
                    );
                  },
                  leading: const Icon(
                    Icons.movie,

                  ),
                  trailing: const Icon(Icons.play_circle, color: MyColor.yellowColor,),
                  // backgroundColor: Colors.white,
                  // collapsedBackgroundColor: Colors.white,
                  title: Text(
                    video.name,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: videos.length,
      ),
    );
  }
}
