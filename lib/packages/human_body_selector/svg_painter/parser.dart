import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_drawing/path_drawing.dart';
import 'package:svg_path_parser/svg_path_parser.dart';

import './constant.dart';
import './models/body_part.dart';
import './size_controller.dart';

class Parser {
  static Parser? _instance;

  static Parser get instance {
    _instance ??= Parser._init();
    return _instance!;
  }

  final sizeController = SizeController.instance;

  Parser._init();

  Future<List<BodyPart>> svgToCityList(String country) async {
    final svgCountry =
        await rootBundle.loadString('${Constants.ASSETS_PATH}/$country');

    List<BodyPart> cityList = [];

    final regExp = RegExp(Constants.MAP_REGEXP,
        multiLine: true, caseSensitive: false, dotAll: false);

    regExp.allMatches(svgCountry).forEach((cityData) {
      final city = BodyPart(
          id: cityData.group(1)!,
          title: cityData.group(2)!.split('\"')[0],
          path: parseSvgPathData(cityData.group(3)!),
          transformedPath: parseSvgPath(cityData.group(3)!));
      final regExp = RegExp(Constants.MAP_SIZE_REGEXP,
          multiLine: true, caseSensitive: false, dotAll: false);
      var firstMatch = regExp.firstMatch(svgCountry);
      var sHeight = firstMatch?.group(1);
      var sWidth = firstMatch?.group(2);
      if (sHeight != null && sWidth != null) {
        double? height = double.tryParse(sHeight);
        double? width = double.tryParse(sWidth);
        if (height != null && width != null) {
          sizeController.addBounds(Rect.fromLTRB(0, 0, width, height));
        } else {
          sizeController.addBounds(city.path.getBounds());
        }
      } else {
        sizeController.addBounds(city.path.getBounds());
      }
      cityList.add(city);
    });
    return cityList;
  }
}
