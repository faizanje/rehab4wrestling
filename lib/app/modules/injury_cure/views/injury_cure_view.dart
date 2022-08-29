import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/widgets/animated_button.dart';

import '../controllers/injury_cure_controller.dart';

class InjuryCureView extends GetView<InjuryCureController> {
   final ExpandedTileController _controller= ExpandedTileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_sharp,color: Colors.black,),
        ),

        title: Text('Injury Video List', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        foregroundDecoration: BoxDecoration(
          backgroundBlendMode: BlendMode.colorBurn,
          color: Colors.black.withOpacity(0.7)
        ),
         decoration: const BoxDecoration(

           gradient: LinearGradient(
             begin: Alignment.topRight,
             end: Alignment.bottomLeft,
             colors: [
               Colors.lightGreenAccent,
               Colors.redAccent
             ]
           ),

         ),
        child: SingleChildScrollView(
          child:ExpandedTileList.builder(
            itemCount: 3,
            maxOpened: 3,
            reverse: false,
            itemBuilder: (context, index, controller) {
              return ExpandedTile(
                trailing: Icon(Icons.arrow_forward_ios_sharp, size: 16,color: Colors.white,),
                leading: Icon(Icons.sports_handball_sharp,color: Colors.redAccent,),
                theme: const ExpandedTileThemeData(
                  headerColor: Colors.black54,
                  headerRadius: 24.0,
                  headerPadding: EdgeInsets.all(24.0),
                  //
                  contentBackgroundColor: Colors.black54,
                  contentPadding: EdgeInsets.all(24.0),
                  contentRadius: 12.0,
                ),
                controller:
                index == 2 ? controller.copyWith(isExpanded: true) : controller,
                title: Text("Injury $index", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                content: Container(
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                            "This is the content!ksdjfl kjsdflk sjdflksjdf lskjfd lsdkfj  ls kfjlsfkjsdlfkjsfldkjsdflkjsfdlksjdflskdjf lksdjflskfjlsfkjslfkjsldfkjslfkjsldfkjsflksjflskjflskfjlsfkjslfkjsflksjflskfjlsfkjslfkjslfkjslfkjslfkjsldfkjsdf",
                           style: TextStyle(color: Colors.white,),
                        ),

                      ),
                      MaterialButton(
                        onPressed: () {
                          controller.collapse();
                        },
                        child: Text("close it!",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
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