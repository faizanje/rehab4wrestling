import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/utils/constant.dart';
import 'package:rehab4wrestling/widgets/animated_button.dart';

import '../controllers/injury_cure_controller.dart';

class InjuryCureView extends GetView<InjuryCureController> {
   final ExpandedTileController _controller= ExpandedTileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/arrow-square-left.svg',
            color: Colors.grey,
          ),
          onPressed: (){
            Get.back();
          },
        ),

        title: const Text('Injury Video List', style: TextStyle(color: Colors.black87,
            fontSize: 22,
            fontFamily: MyFont.fontModernist,
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:ExpandedTileList.builder(
            itemCount: 3,
            maxOpened: 3,
            reverse: false,
            itemBuilder: (context, index, controller) {
              return ExpandedTile(
                contentSeperator: 12.0,
                trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 16,color: Colors.cyan,),
                leading: const Icon(Icons.sports_handball_sharp,color: Colors.cyan,),
                theme: const ExpandedTileThemeData(
                  headerColor: Colors.white,
                  headerSplashColor: Colors.cyan,
                  headerRadius: 16.0,
                  headerPadding: EdgeInsets.all(24.0),
                  contentBackgroundColor: Colors.white,
                  contentPadding: EdgeInsets.all(24.0),
                  contentRadius: 12.0,
                ),
                controller:
                index == 2 ? controller.copyWith(isExpanded: true) : controller,
                title: Text("Injury $index", style: const TextStyle(color: Colors.black87
                    , fontSize: 16,
                    fontFamily: MyFont.fontModernist,
                  package: 'assets:fonts/Sk-Modernist-Regular'


                ),),
                content: Column(
                  children: [
                    const Center(
                      child: Text(
                        "This is the content!ksdjfl kjsdflk sjdflksjdf lskjfd lsdkfj  ls kfjlsfkjsdlfkjsfldkjsdflkjsfdlksjdflskdjf lksdjflskfjlsfkjslfkjsldfkjslfkjsldfkjsflksjflskjflskfjlsfkjslfkjsflksjflskfjlsfkjslfkjslfkjslfkjslfkjsldfkjsdf",
                        style: TextStyle(color: Colors.black87,
                         fontFamily: MyFont.fontModernist,
                          package: 'assets:fonts/Sk-Modernist-Regular'

                        ),
                      ),

                    ),
                    const SizedBox(height: 20,),
                    Container(
                      height: 42,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                        ],
                         gradient: MyColor.linearGradient,
                        color: Colors.deepPurple.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
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
                onTap: () {
                  debugPrint("tapped!!");
                },
                onLongTap: () {
                  debugPrint("looooooooooong tapped!!");
                },
              );
            },
          ),
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