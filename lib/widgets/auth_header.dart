import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class AuthHeader extends StatelessWidget {
  const AuthHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/arrow-square-left.svg',
            color: Colors.grey,
          ),
          onPressed: (){
            Get.back();
          },
        ),
        SvgPicture.asset(
          'assets/Component 1.svg',
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
