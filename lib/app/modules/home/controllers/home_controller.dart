import 'package:better_player/better_player.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/FirebaseService.dart';
import 'package:rehab4wrestling/app/data/models/WrestlingDataItem.dart';

class HomeController extends GetxController with StateMixin {
  RxString injuryName = ''.obs;

  static HomeController get instance => Get.find<HomeController>();

  // RxList<WrestlingDataItem> wrestlingDataItemsObs = RxList();
  RxMap<String, WrestlingDataItem> wrestlingDataItemsMapObs = RxMap();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initData();
  }

  Future<void> initData() async {
    change(null, status: RxStatus.loading());
    final list = await FirebaseService.fetchDataFromFirebase();
    if (list.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      Map<String, WrestlingDataItem> map = {
        for (var item in list) item.name: item
      };
      wrestlingDataItemsMapObs.value = map;
      change(null, status: RxStatus.success());
    }
  }
}
