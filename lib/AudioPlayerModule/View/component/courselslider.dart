import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:podcast/AudioPlayerModule/ViewModel/audioplayer_model.dart';


import '../../../utlis/Constants/AppConfig.dart';
import '../../model/image_model.dart';
import '../../sevices/podcast_image_services.dart';

class CarouselSliderTile extends StatefulWidget {
  CarouselSliderTile({Key? key, required this.val, required this.uid}) : super(key: key);
  int val;
  String uid;
  @override
  State<CarouselSliderTile> createState() => _CarouselSliderTileState();
}

class _CarouselSliderTileState extends State<CarouselSliderTile> {
  CarouselController carouselController = CarouselController();
  CarouselController carouselController2 = CarouselController();
final imageController = Get.put(GetImageController());
   
 

  @override
  void initState() {
   
    // func();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return func();
  }

  func() {
    for (int i = 0; i < imageController.imageList.length; i++) {
      if (i + 1 < imageController.imageList.length) {
        if (imageController.imageList[i].time <= widget.val &&
            imageController.imageList[i + 1].time >= widget.val) {
          if (imageController.newList.contains(imageController.imageList[i].url)) {
            print('ImageList:''${imageController.imageList.length}');
            print(imageController.newList.length);
          }
           
          else {
            
            imageController.newList.add(imageController.imageList[i].url);

            print(imageController.newList.length);
            Future.delayed(Duration(microseconds: 300), () {
              carouselController.animateToPage(imageController.newList.length);
            });
          }
          return CarouselSlider(
            carouselController: carouselController,
            items: imageController.newList.map((i) {
              return InkWell(
                  onTap: () async {
                    print(widget.uid);
                    String path = "http://143.110.182.106:8800/images/"+'${i}';
                    print(path);
                   GallerySaver.saveImage(path).then((value) {
                    setState(() {
                      print('save');
                    });
                   });
                  },
                  child: Container(
                    width: AppConfig(context).width / 1.1,
                    height: AppConfig(context).height / 1.9,
                    decoration: BoxDecoration(
                       color: Colors.transparent,
                        image: DecorationImage(
                            image: NetworkImage("http://143.110.182.106:8800/images/"+'${i}'), fit: BoxFit.cover),
                        // color: Colors.orange,
                        borderRadius: BorderRadius.circular(12)),
                  ));
            }).toList(),
            options: CarouselOptions(
              height:AppConfig(context).height / 1.9,
              aspectRatio: 16 / 9,
              viewportFraction:0.8,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: Duration(minutes: 1),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
        // } else {
        //   return Center(
        //     child: GestureDetector(
        //       onTap: () {
        //         print(imageController.newList.length);
        //       },
        //       child: Container(
        //         width: AppConfig(context).width / 1.1,
        //         height: AppConfig(context).height / 1.9,
        //         decoration: BoxDecoration(
        //             image: DecorationImage(
        //                 image: NetworkImage(
        //                     "https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699"),
        //                 fit: BoxFit.cover)),
        //       ),
        //     ),
        //   );
        // }
      } else {
        if (imageController.imageList[i].time <= widget.val) {
          if (imageController.newList.contains(imageController.imageList[i].url)) {

            // carouselController.animateToPage(imageController.newList.length);
            print(imageController.newList.length);
          } else {
            print(imageController.newList.length);
            if(imageController.newList.length < imageController.imageList.length){
              imageController.newList.add(imageController.imageList[i].url);
              Future.delayed(Duration(microseconds: 300), () {
              carouselController.animateToPage(imageController.newList.length);
            });

            }
            else {
 Future.delayed(Duration(seconds: 1), (){
              carouselController2.animateToPage(imageController.newList.length);

            });
            }
            
          }
          return CarouselSlider(
            carouselController: carouselController2,
            items: imageController.newList.map((i) {
              return InkWell(
                  onTap: () {
                    String path = "http://143.110.182.106:8800/images/"+'${i}';
                    
                    GallerySaver.saveImage(path).then((value) {
                    setState(() {
                      print('hi');
                    });
                   });
                    print(i);
                  },
                  child: Builder(
                    builder: (context) {
                      return Container(
                        width: AppConfig(context).width / 1.1,
                        height: AppConfig(context).height / 1.9,
                        decoration: BoxDecoration(
                             color: Colors.transparent,
                            image: DecorationImage(
                                image: NetworkImage("http://143.110.182.106:8800/images/"+'${i}'), fit: BoxFit.cover),
                            // color: Colors.orange,
                            borderRadius: BorderRadius.circular(12)),
                      );
                    }
                  ));
            }).toList(),
            options: CarouselOptions(
              
              height: AppConfig(context).height / 1.9,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: Duration(minutes: 1),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
      }
    }
    return GestureDetector(
      onTap: (){
        print(widget.uid);
      },
      child: Container(
                      width: AppConfig(context).width / 1.1,
                      height: AppConfig(context).height / 1.9,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                          image: DecorationImage(
                              image: NetworkImage("https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699"), fit: BoxFit.cover),
                          // color: Colors.orange,
                          borderRadius: BorderRadius.circular(12)),
                    ),
    );
  }
}
