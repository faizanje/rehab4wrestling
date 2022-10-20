import 'package:flutter/material.dart';

class TabItem {
  final Widget icon;
  final String? title;
  final Widget page;
  final Function()? onTap;

  const TabItem({
    required this.icon,
    required this.page,
    this.title,
    this.onTap,
  });
}

class TabItemV2 {
  final String title;
  final Widget page;
  final Function()? onTap;

  const TabItemV2({
    required this.page,
    required this.title,
    this.onTap,
  });
}
