import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/models/WrestlingDataItem.dart';
import 'package:rehab4wrestling/app/data/models/args/VideosListArgs.dart';
import 'package:rehab4wrestling/app/modules/home/controllers/home_controller.dart';

class VideosListController extends GetxController {
  late final VideosListArgs args;
  late final String bodyPartKey;

  static VideosListController get instance => Get.find<VideosListController>();
  final homeController = HomeController.instance;

  Data get wrestlingDataItemData =>
      homeController.wrestlingDataItemsMapObs[bodyPartKey]!.data;

  @override
  void onInit() {
    args = Get.arguments;
    bodyPartKey = args.bodyPartArgs.bodyPartKey;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
