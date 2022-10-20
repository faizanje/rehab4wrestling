import 'package:rehab4wrestling/app/data/models/MyVideo.dart';
import 'package:rehab4wrestling/app/data/models/WrestlingDataItem.dart';

class FullScreenVideoArgs {
  final MyVideo video;
  final Injuries injuries;

  FullScreenVideoArgs({
    required this.video,
    required this.injuries,
  });
}
