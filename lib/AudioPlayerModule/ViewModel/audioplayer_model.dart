
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:podcast/AudioPlayerModule/model/image_model.dart';
import 'package:podcast/AudioPlayerModule/sevices/podcast_image_services.dart';

import '../../page_manager.dart';
class GetImageController extends GetxController {
  
  //  late PodcastImage  podcast;
  RxList<NewImageModel> imageList = <NewImageModel>[].obs;
  List newList = [].obs;


  PodcastImage? imageModelList;
  RxInt totalTime = 0.obs;
// RxBool check = false.obs;

Future<List<PodcastImage>> updateList({required String uId}) async {
  List<PodcastImage> podCastImageList = <PodcastImage>[];
  podCastImageList = await loadImageService(uid: uId);


for(int i = 0 ;i < podCastImageList.length; i++){
    print('id: ' '${podCastImageList[i]}');
  if(podCastImageList[i].userPodcastId == uId){
    // check.value = true;
    print('woho');
    imageModelList = podCastImageList[i] ;
// imageModelList.add(Models(img: podCastImageList[i].img, time: podCastImageList[i].time));
    for (int i = 0; i < imageModelList!.img.length; i++) {
     print('image:' '${imageModelList!.img}');
      String time = imageModelList!.time;
      var d = time.split(':');
      int a = int.parse(d[1]) * 60;
      int b = int.parse(d[2]) % 60;
      int total = a + b;
      totalTime.value = total;
      imageList.add(NewImageModel(time: total, url: imageModelList!.img));
    }
  }
      
    }

   return podCastImageList;
  //  update();
    // imageList.add(data[i++]);
  }


  // increament({required dynamic value, required PageManager pageManager}){
 
  // }
}

