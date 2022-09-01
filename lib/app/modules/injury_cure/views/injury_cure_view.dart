import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/themes/app_theme.dart';
import 'package:rehab4wrestling/utils/constant.dart';
import 'package:rehab4wrestling/widgets/animated_button.dart';

import '../controllers/injury_cure_controller.dart';

class InjuryCureView extends GetView<InjuryCureController> {
  const InjuryCureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Injury Video List',
          style: TextStyle(
              color: Colors.black87, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
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
                  child: ExpansionTile(
                    leading: const Icon(
                      Icons.sports_handball_sharp,
                      color: Colors.cyan,
                    ),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    title: Text(
                      "Injury ${index + 1}",
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Center(
                              child: Text(
                                "Lorem ipsum dolor sit amet. Ut accusamus magni id necessitatibus quasi nam repellat porro nam neque Quis in nulla voluptas qui omnis quidem? Qui voluptas minima sit unde facere et voluptatem facere. Vel architecto esse et doloribus quia est dolorum inventore et esse odio et voluptas voluptatem est commodi dolore.",
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 42,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 4),
                                      blurRadius: 5.0)
                                ],
                                gradient: MyColor.linearGradient,
                                color: Colors.deepPurple.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Get.toNamed(Routes.FULL_SCREEN_VIDEO_PLAYER);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.play_circle),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Text(
                                        "Watch video",
                                        style: TextStyle(
                                          // fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 15,
        ),
      ),
    );

    // Column(
    //   children: List.generate(12, (index) =>
    //
    //        ExpandedTile(
    //         theme: const ExpandedTileThemeData(
    //           headerColor: Colors.white,
    //           headerRadius: 24.0,
    //           headerPadding: EdgeInsets.all(24.0),
    //           headerSplashColor: Colors.red,
    //           contentBackgroundColor: Colors.blue,
    //           contentPadding: EdgeInsets.all(24.0),
    //           contentRadius: 12.0,
    //         ),
    //         controller: _controller,
    //         title: const Text("this is the title"),
    //         content: Container(
    //           color: Colors.red,
    //           child: const Center(
    //             child: Text("This is the content!"),
    //           ),
    //         ),
    //         onTap: () {
    //           debugPrint("tapped!!");
    //         },
    //         onLongTap: () {
    //           debugPrint("long tapped!!");
    //         },
    //       ),
    //   ),

    //
    //         ),
    //       ),
    //     ),
    // );
  }
}

// Material(
// color: Colors.transparent,
// child: InkWell(
//
// focusColor: Colors.green,
// borderRadius: BorderRadius.circular(16),
//
// overlayColor: MaterialStateProperty.all(Colors.red),
// onTap: (){
// Get.toNamed(Routes.FULL_SCREEN_VIDEO_PLAYER);
//
// },
// child: Container(
// margin: EdgeInsets.symmetric(vertical: 5),
// height: 65,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(16),
// color: Colors.black54,
//
// ),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
//
//
// TextButton.icon(onPressed: (){}, icon: const Icon(Icons.play_circle_fill_rounded,color: Colors.redAccent,), label: const Text("Injury Video",
// style: TextStyle(color: Colors.white, fontSize: 16),
//
// )),
// const Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,size: 18,),
// ],
// ),
// ),
// ),
// ),
// )
