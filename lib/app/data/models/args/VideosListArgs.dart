
import 'package:rehab4wrestling/app/data/models/WrestlingDataItem.dart';

class VideosListArgs{
  final Injuries injury;
  final String bodyPartKey;

  const VideosListArgs({
    required this.injury,
    required this.bodyPartKey,
  });
}