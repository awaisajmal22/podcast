// import 'dart:ui';

// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:get/get.dart';
// import 'package:podcast/fire_base_data_view_model.dart';
// import 'package:podcast/firebase_data_model.dart';
// import 'package:podcast/page_manager.dart';
// import 'package:podcast/utlis/Constants/AppConfig.dart';
// import 'package:podcast/utlis/logout_button.dart';

// class CustomAudioPlayer extends StatefulWidget {
//   String url;
//   String uid;
//   String name;

//   CustomAudioPlayer({Key? key, required this.url, required this.uid,required this.name})
//       : super(key: key);

//   @override
//   _CustomAudioPlayerState createState() => _CustomAudioPlayerState();
// }

// class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
//   late final PageManager _pageManager;
//   var controller1 =FirebaseDataViewModel();

//   var controller = Get.put(FirebaseDataViewModel());

//   import 'firebase_data_model.dart';

// FireBaseModelByData? datayu;
//   List tempList = [];

//   bool check = false;
//   bool imageNext=false;

//   @override
//   void initState() {
//     super.initState();
//     _pageManager = PageManager(urlBy: widget.url);
//     print(widget.uid.toString());
//     print("widget.url");

//     print(widget.url);
    // for (int i = 0; i < controller.dataFirebase.length; i++) {
//       if (controller.dataFirebase[i].podcastId == widget.uid) {
//         print("yuyuyuhi");
//         check = true;
//         datayu = controller.dataFirebase[i];
//         for (int i = 0; i < datayu!.images.length; i++) {
//           String tempvt = datayu!.images[i].time;
//           var data = tempvt.split(":");

//           int gfy = int.parse(data[0]) * 60;
//           int gfy1 = int.parse(data[1]) % 60;
//           int total = gfy + gfy1;

//           print("startTime");
//           print(total);
//           // String tempet = datayu!.images[i].endTime;
//           // var data1 = tempet.split(":");
//           // int gfy2 = int.parse(data1[0]) * 60;
//           // int gfy3 = int.parse(data1[1]) % 60;
//           // int total1 = gfy2 + gfy3;
//           // print("EndTime");
//           // print(total1);
//           print(datayu!.images[i].imgUrl);
//           tempList.add(TempModel(st: total, image: datayu!.images[i].imgUrl));
//           // print(tempet);
//           print(total);
//           // print(total1);
//           print(gfy1);
//           print(data);
//           // print(data1);
//           print(tempList);
//         }
//       }
//     }
//   }
//   CarouselController carouselController=CarouselController();
//   CarouselController carouselController2=CarouselController();

//   @override
//   void dispose() {
//     _pageManager.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Stack(
//           // alignment: Alignment.bottomRight,
//           children: [

//             ValueListenableBuilder<ProgressBarState>(
//               valueListenable: _pageManager.progressNotifier,
//               builder: (_, value, __) {
//                 return check
//                     ? tempfunction(value: value.current.inSeconds,temp:tempList, context: context )
//                     :SizedBox(
//                   width:AppConfig(context).width,
//                   height:AppConfig(context).height,


//                   child:Stack(
//                     children: [
//                       Image.network("https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699", fit: BoxFit.fill, width:AppConfig(context).width,
//                         height:AppConfig(context).height/2,),
//                       ClipRRect( // Clip it cleanly.
//                         child: BackdropFilter(
//                           filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//                           child: Container(
//                               height:AppConfig(context).height/1.9// color: Colors.grey.withOpacity(0.1),

//                           ),

//                         ),
//                       ),
//                       Positioned(
//                         top: 50,
//                         left: 15,
//                         child: Container(
//                           width:AppConfig(context).width/1.1,
//                           height:AppConfig(context).height/1.9,

//                           decoration: BoxDecoration(
//                               image:const DecorationImage(image:NetworkImage("https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699"),fit: BoxFit.cover ),
//                               // color: Colors.orange,
//                               borderRadius: BorderRadius.circular(12)
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),


//                 );
//               },
//             ),
//            const  SizedBox(height: 20,),
//             Column(

//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold),),
//                 ),
//                 const  SizedBox(height: 10,),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10,right: 10),
//                   child: ValueListenableBuilder<ProgressBarState>(
//                     valueListenable: _pageManager.progressNotifier,
//                     builder: (_, value, __) {
//                       return ProgressBar(
//                         progressBarColor: Colors.black,
//                         bufferedBarColor: Colors.black12 ,
//                         baseBarColor:Colors.black12 ,
//                         thumbColor:Colors.black ,
//                         progress: value.current,
//                         buffered: value.buffered,
//                         total: value.total,
//                         onSeek: _pageManager.seek,
//                       );
//                     },
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ValueListenableBuilder<ProgressBarState>(
//                       valueListenable: _pageManager.progressNotifier,
//                       builder: (_, value, __) {
//                         return IconButton(
//                           icon: const ImageIcon(AssetImage("image/player/previous.png"),color: Colors.black,),
//                           iconSize: 32.0,
//                           onPressed: (){
//                             _pageManager.seek(Duration(seconds:value.current.inSeconds-10));
//                           },
//                         );
//                       },
//                     ),
//                    const  SizedBox(width: 20,),
//                     ValueListenableBuilder<ButtonState>(
//                       valueListenable: _pageManager.buttonNotifier,
//                       builder: (_, value, __) {
//                         switch (value) {
//                           case ButtonState.loading:
//                             return Container(
//                               margin: const EdgeInsets.all(8.0),
//                               width: 64.0,
//                               height: 64.0,
//                               child: const CircularProgressIndicator(color: Colors.black,),
//                             );
//                           case ButtonState.paused:
//                             return IconButton(
//                               icon: const ImageIcon(AssetImage("image/player/play.png"),color: Colors.black,),
//                               iconSize: 64.0,
//                               onPressed: (){
//                                 _pageManager.play();
//                               },
//                             );
//                           case ButtonState.playing:
//                             return IconButton(
//                               icon: const ImageIcon(AssetImage("image/player/pause.png"),color: Colors.black,),
//                               iconSize: 64.0,
//                               onPressed: _pageManager.pause,
//                             );
//                         }
//                       },
//                     ),
//                     const  SizedBox(width: 20,),
//                     ValueListenableBuilder<ProgressBarState>(
//                       valueListenable: _pageManager.progressNotifier,
//                       builder: (_, value, __) {
//                         return IconButton(
//                           icon: const ImageIcon(AssetImage("image/player/forward.png"),color: Colors.black,),
//                           iconSize: 32.0,
//                           onPressed: (){
//                             _pageManager.seek(Duration(seconds: value.current.inSeconds+10));
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),

//               ],
//             ),
//             SizedBox(
//               height: 50,
//               // color: Colors.orange,
//               child: Row(
//                 children: [
//                 IconButton(
//                       icon:const  Icon(Icons.arrow_back_ios, color: Colors.black),
//                       onPressed: () => Navigator.of(context).pop(),
//                     )
//                 ],
//               ),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
//   Widget tempfunction({required int value,required List temp,required BuildContext context }){

//     for(int i=0;i<temp.length;i++){

//       if(i+1<temp.length){
//         print(i);
//         print(temp.length);
//         if(temp[i].st <= value  && temp[i+1].st>=value){
//           if( controller1.imageList.contains(temp[i].image)){
//             print("mknknknd"); print( controller1.imageList.length);
//           }
//           else{
//               imageNext=true;
//             print( imageNext);
//             controller1.imageList.add(temp[i].image);
//               // setState(() {
//                 carouselController.animateToPage(controller1.imageList.length);
//               // });
//             // Future.delayed(Duration(seconds: 10));
//             print( imageNext);

//              imageNext=false;

//             print( imageNext);

//           }
//           return  SizedBox(
//             width:AppConfig(context).width,
//             height:AppConfig(context).height,


//             child: Padding(
//               padding: const EdgeInsets.only(top: 40,bottom: 30),
//               child: Stack(
//                 children: [
//                   ClipRRect( // Clip it cleanly.
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//                       child: Container(
//                           height:AppConfig(context).height/2// color: Colors.grey.withOpacity(0.1),
//                       ),
//                     ),
//                   ),
//                   Material(
//                     child:CarouselSlider(
//                       carouselController: carouselController,
//                       options: CarouselOptions(
//                         height:350,
//                         aspectRatio: 16/9,
//                         viewportFraction: 0.8,
//                         initialPage: 0,
//                         enableInfiniteScroll: false,
//                         reverse: false,
//                         autoPlay: false,
//                         autoPlayInterval: Duration(minutes: 1),
//                         autoPlayAnimationDuration: Duration(milliseconds: 800),
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enlargeCenterPage: true,
//                         scrollDirection: Axis.horizontal,
//                       ),
//                       items:controller1.imageList.map((i) {
//                         return InkWell(
//                           onTap: (){
//                             onLogout(
//                                 context: context,
//                                 title: 'Are you sure?',
//                                 discription:
//                                 'Do you want to Save',
//                                 height: 150,
//                                 callback: () async {
//                                   String path =i;

//                                   GallerySaver.saveImage(path).then((success) {
//                                     setState(() {
//                                       print('Image is saved');
//                                     });
//                                   });
//                                 });
//                           },
//                           child: Builder(
//                             builder: (BuildContext context) {
//                               return    Container(
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(image:NetworkImage(i),fit: BoxFit.cover ),
//                                     // color: Colors.orange,
//                                     borderRadius: BorderRadius.circular(12)
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   )


//                 ],
//               ),
//             ),
//           );
//         }

//       }
//       else{
//         print("==");
//         if(temp[i].st <= value  ){

//           if( controller1.imageList.contains(temp[i].image)){
//             print("mknknknd"); print( controller1.imageList.length);
//           }
//           else{
//             controller1.imageList.add(temp[i].image);
//             // setState(() {
//               carouselController2.animateToPage(controller1.imageList.length);
//             // });
//           }
//           return  SizedBox(
//             width:AppConfig(context).width,
//             height:AppConfig(context).height,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 40,bottom: 30),
//               child: Stack(
//                 children: [
//                   ClipRRect( // Clip it cleanly.
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//                       child: Container(
//                           height:AppConfig(context).height/2// color: Colors.grey.withOpacity(0.1),
//                       ),
//                     ),
//                   ),
//                   Material(
//                     child:CarouselSlider(
//                       carouselController:carouselController2 ,
//                       options: CarouselOptions(
//                         height:350,
//                         aspectRatio: 16/9,
//                         viewportFraction: 0.8,
//                         initialPage: 0,
//                         enableInfiniteScroll: false,
//                         reverse: false,
//                         autoPlay: false,
//                         autoPlayInterval: Duration(minutes: 1),
//                         autoPlayAnimationDuration: Duration(milliseconds: 800),
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enlargeCenterPage: true,
//                         scrollDirection: Axis.horizontal,
//                       ),
//                       items:controller1.imageList.map((i) {
//                         return InkWell(
//                           onTap: (){
//                             onLogout(
//                                 context: context,
//                                 title: 'Are you sure?',
//                                 discription:
//                                 'Do you want to Save',
//                                 height: 150,
//                                 callback: () async {
//                                   String path =i;

//                                   GallerySaver.saveImage(path).then((success) {

//                                     setState(() {
//                                       print('Image is saved');
//                                     });
//                                   });
//                                 });
//                           },
//                           child: Builder(
//                             builder: (BuildContext context) {
//                               return    Container(
//                                 decoration: BoxDecoration(
//                                     image: DecorationImage(image:NetworkImage(i),fit: BoxFit.cover ),
//                                     // color: Colors.orange,
//                                     borderRadius: BorderRadius.circular(12)
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   )


//                 ],
//               ),
//             ),
//           );
//         }
//       }

//     }
//     return SizedBox(
//       width:AppConfig(context).width,
//       height:AppConfig(context).height,


//       child:Stack(
//         children: [
//           Image.network("https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699", fit: BoxFit.fill, width:AppConfig(context).width,
//             height:AppConfig(context).height/2,),
//           ClipRRect( // Clip it cleanly.
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//               child: Container(
//                   height:AppConfig(context).height/1.9// color: Colors.grey.withOpacity(0.1),

//                 // child:

//                 // child: Text('CHOCOLATE'),
//               ),

//             ),
//           ),
//           Positioned(
//             top: 50,
//             left: 15,
//             child: Container(
//               width:AppConfig(context).width/1.1,
//               height:AppConfig(context).height/1.9,

//               decoration: BoxDecoration(
//                   image:const DecorationImage(image:NetworkImage("https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699"),fit: BoxFit.cover ),
//                   // color: Colors.orange,
//                   borderRadius: BorderRadius.circular(12)
//               ),
//             ),
//           ),
//         ],
//       ),


//     );

//   }
// }

// class TempModel {
//   int st;

//   String image;

//   TempModel({required this.st, required this.image});
// }

//  Widget tempfunction({required int value,required List temp,required BuildContext context }){
//    var controller1 =FirebaseDataViewModel();
//   for(int i=0;i<temp.length;i++){
//
//    if(i+1<temp.length){
//      print(i);
//      print(temp.length);
//      if(temp[i].st <= value  && temp[i+1].st>=value){
//        if( controller1.imageList.contains(temp[i].image)){
//          print("mknknknd"); print( controller1.imageList.length);
//        }else{
//          controller1.imageList.add(temp[i].image);
//        }
//
//
//        return  SizedBox(
//          width:AppConfig(context).width,
//          height:AppConfig(context).height,
//
//          child: Stack(
//            // alignment: Alignment.bottomCenter,
//            children: [
//              Image.network(temp[i].image, fit: BoxFit.fill, width:AppConfig(context).width,
//                height:AppConfig(context).height/2,),
//              ClipRRect( // Clip it cleanly.
//                child: BackdropFilter(
//                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//                  child: Container(
//                      height:AppConfig(context).height/1.9// color: Colors.grey.withOpacity(0.1),
//
//                    // child:
//
//                    // child: Text('CHOCOLATE'),
//                  ),
//
//                ),
//              ),
//              Material(
//                child:CarouselSlider(
//                  options: CarouselOptions(
//                    height:350,
//                    aspectRatio: 16/9,
//                    viewportFraction: 0.8,
//                    initialPage: 0,
//                    enableInfiniteScroll: true,
//                    reverse: false,
//                    autoPlay: false,
//                    autoPlayInterval: Duration(seconds: 3),
//                    autoPlayAnimationDuration: Duration(milliseconds: 800),
//                    autoPlayCurve: Curves.fastOutSlowIn,
//                    enlargeCenterPage: true,
//                    scrollDirection: Axis.horizontal,
//                  ),
//                  items:controller1.imageList.map((i) {
//                    return Builder(
//                      builder: (BuildContext context) {
//                        return    Container(
//                          // width:AppConfig(context).width/1.1,
//                          // height:AppConfig(context).height/1.9,
//
//                          decoration: BoxDecoration(
//                              image: DecorationImage(image:NetworkImage(i),fit: BoxFit.cover ),
//                              // color: Colors.orange,
//                              borderRadius: BorderRadius.circular(12)
//                          ),
//                        );
//                      },
//                    );
//                  }).toList(),
//                ),
//              )
//            ],
//          ),
//        );
//      }
//
//    }else{
//      print("==");
//      if(temp[i].st <= value  ){
//
//        if( controller1.imageList.contains(temp[i].image)){
//          print("mknknknd"); print( controller1.imageList.length);
//        }else{
//          controller1.imageList.add(temp[i].image);
//        }
//        return  SizedBox(
//          width:AppConfig(context).width,
//          height:AppConfig(context).height,
//
//
//          child: Stack(
//            children: [
//              Image.network(temp[i].image, fit: BoxFit.fill, width:AppConfig(context).width,
//                height:AppConfig(context).height/2,),
//              ClipRRect( // Clip it cleanly.
//                child: BackdropFilter(
//                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//                  child: Container(
//                      height:AppConfig(context).height/1.9// color: Colors.grey.withOpacity(0.1),
//
//
//                  ),
//
//                ),
//              ),
//              Material(
//                  child:CarouselSlider(
//                  options: CarouselOptions(
//                    height:350,
//                    aspectRatio: 16/9,
//                    viewportFraction: 0.8,
//                    initialPage: 0,
//                    enableInfiniteScroll: true,
//                    reverse: false,
//                    autoPlay: true,
//                    autoPlayInterval: Duration(seconds: 3),
//                    autoPlayAnimationDuration: Duration(milliseconds: 800),
//                    autoPlayCurve: Curves.fastOutSlowIn,
//                    enlargeCenterPage: true,
//                    scrollDirection: Axis.horizontal,
//                  ),
//                  items:controller1.imageList.map((i) {
//                    return Builder(
//                      builder: (BuildContext context) {
//                        return    Container(
//                          // width:AppConfig(context).width/1.1,
//                          // height:AppConfig(context).height/1.9,
//
//                          decoration: BoxDecoration(
//                              image: DecorationImage(image:NetworkImage(i),fit: BoxFit.cover ),
//                              // color: Colors.orange,
//                              borderRadius: BorderRadius.circular(12)
//                          ),
//                        );
//                      },
//                    );
//                  }).toList(),
//                  ),
//                )
//
//
//            ],
//          ),
//        );
//      }
//    }
//
//   }
//   return SizedBox(
//     width:AppConfig(context).width,
//     height:AppConfig(context).height,
//
//
//     child:Stack(
//       children: [
//         Image.network("https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699", fit: BoxFit.fill, width:AppConfig(context).width,
//           height:AppConfig(context).height/2,),
//         ClipRRect( // Clip it cleanly.
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//             child: Container(
//                 height:AppConfig(context).height/1.9// color: Colors.grey.withOpacity(0.1),
//
//               // child:
//
//               // child: Text('CHOCOLATE'),
//             ),
//
//           ),
//         ),
//         Positioned(
//           top: 50,
//           left: 15,
//           child: Container(
//             width:AppConfig(context).width/1.1,
//             height:AppConfig(context).height/1.9,
//
//             decoration: BoxDecoration(
//                 image:const DecorationImage(image:NetworkImage("https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699"),fit: BoxFit.cover ),
//                 // color: Colors.orange,
//                 borderRadius: BorderRadius.circular(12)
//             ),
//           ),
//         ),
//       ],
//     ),
//
//
//   );
//
// }
// Widget tempfunction({required int value,required List temp,required BuildContext context }){
//
//   for(int i=0;i<temp.length;i++){
//    if(i+1<temp.length){
//      print(i);
//      print(temp.length);
//      if(temp[i].st <= value  && temp[i+1].st>=value){
//        return   SizedBox(
//          width:AppConfig(context).width,
//          height:AppConfig(context).height,
//
//          child: Stack(
//            children: [
//              Image.network(temp[i].image, fit: BoxFit.fill, width:AppConfig(context).width,
//                height:AppConfig(context).height/2,),
//              ClipRRect( // Clip it cleanly.
//                child: BackdropFilter(
//                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//                  child: Container(
//                      height:AppConfig(context).height/1.9// color: Colors.grey.withOpacity(0.1),
//
//                    // child:
//
//                    // child: Text('CHOCOLATE'),
//                  ),
//
//                ),
//              ),
//              Positioned(
//                top: 50,
//                left: 15,
//                child: Container(
//                  width:AppConfig(context).width/1.1,
//                  height:AppConfig(context).height/1.9,
//
//                  decoration: BoxDecoration(
//                      image: DecorationImage(image:NetworkImage(temp[i].image),fit: BoxFit.cover ),
//                      // color: Colors.orange,
//                      borderRadius: BorderRadius.circular(12)
//                  ),
//                ),
//              ),
//            ],
//          ),
//        );
//      }
//
//    }else{
//      print("==");
//      if(temp[i].st <= value  ){
//        return  SizedBox(
//          width:AppConfig(context).width,
//          height:AppConfig(context).height,
//
//
//          child: Stack(
//            children: [
//              Image.network(temp[i].image, fit: BoxFit.fill, width:AppConfig(context).width,
//                height:AppConfig(context).height/2,),
//              ClipRRect( // Clip it cleanly.
//                child: BackdropFilter(
//                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//                  child: Container(
//                      height:AppConfig(context).height/1.9// color: Colors.grey.withOpacity(0.1),
//
//
//                  ),
//
//                ),
//              ),
//              Positioned(
//                top: 50,
//                left: 15,
//                child: Container(
//                  width:AppConfig(context).width/1.1,
//                  height:AppConfig(context).height/1.9,
//
//                  decoration: BoxDecoration(
//                      image: DecorationImage(image:NetworkImage(temp[i].image),fit: BoxFit.cover ),
//                      // color: Colors.orange,
//                      borderRadius: BorderRadius.circular(12)
//                  ),
//                ),
//              ),
//            ],
//          ),
//        );
//      }
//    }
//
//   }
//   return SizedBox(
//     width:AppConfig(context).width,
//     height:AppConfig(context).height,
//
//
//     child:Stack(
//       children: [
//         Image.network("https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699", fit: BoxFit.fill, width:AppConfig(context).width,
//           height:AppConfig(context).height/2,),
//         ClipRRect( // Clip it cleanly.
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//             child: Container(
//                 height:AppConfig(context).height/1.9// color: Colors.grey.withOpacity(0.1),
//
//               // child:
//
//               // child: Text('CHOCOLATE'),
//             ),
//
//           ),
//         ),
//         Positioned(
//           top: 50,
//           left: 15,
//           child: Container(
//             width:AppConfig(context).width/1.1,
//             height:AppConfig(context).height/1.9,
//
//             decoration: BoxDecoration(
//                 image:const DecorationImage(image:NetworkImage("https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699"),fit: BoxFit.cover ),
//                 // color: Colors.orange,
//                 borderRadius: BorderRadius.circular(12)
//             ),
//           ),
//         ),
//       ],
//     ),
//
//
//   );
//
// }


