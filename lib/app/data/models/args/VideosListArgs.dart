import 'package:rehab4wrestling/app/data/models/WrestlingDataItem.dart';
import 'package:rehab4wrestling/app/data/models/args/BodyPartArgs.dart';

class VideosListArgs {
  final Injuries injury;
  final BodyPartArgs bodyPartArgs;

  const VideosListArgs({
    required this.injury,
    required this.bodyPartArgs,
  });
}
