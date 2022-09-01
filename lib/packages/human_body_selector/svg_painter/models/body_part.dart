import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class BodyPart extends Equatable {
  String id;
  String title;
  Path path;
  Path? transformedPath;
  int painLevel = 0;

  BodyPart({required this.id, required this.title, required this.path, this.transformedPath, this.painLevel = 0});

  /// transforms a [_path] into [_transformedPath] using given [matrix]
  void transform(Matrix4 matrix) =>
      transformedPath = path.transform(matrix.storage);

  @override
  List<Object?> get props => [id];
 }