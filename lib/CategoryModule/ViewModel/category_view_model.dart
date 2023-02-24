

import 'package:get/get.dart';
import 'package:podcast/CategoryModule/Model/catevory_model.dart';
import 'package:podcast/CategoryModule/Services/category_service.dart';
import 'package:podcast/Home/Model/podcast_model.dart';

class CategoryViewModel extends GetxController{
  var dataList=[].obs;
  var savdataList=[].obs;
  RxList<CategoryModel> dataCategory=[
    CategoryModel(image: "image/category/iamge6.jpg", name: "comedy"),
    CategoryModel(image: "image/category/image.jpg", name: "music"),
    CategoryModel(image: "image/category/image1.jpg", name: "sport"),
    CategoryModel(image: "image/category/image2.jpg", name: "news"),
    CategoryModel(image: "image/category/image3.jpg", name: "talkShow"),
    CategoryModel(image: "image/category/image4.jpg", name: "world"),
  ].obs;
  Future<List<PodcastModel>> getCategoryDataByVM({required String url}) async {
    List<PodcastModel> data =  await  categoryDataListService(url);
    dataList.value=data;
    savdataList.value=data;
    return data;
  }

}