

import 'package:get/get.dart';
import 'package:podcast/Home/Model/home_data_model.dart';
import 'package:podcast/Home/Model/podcast_model.dart';
import 'package:podcast/Home/Service/feed_data_service.dart';
import 'package:podcast/Home/Service/home_data_get.dart';
import 'package:podcast/utlis/hive_helper_sevices.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

class HomeViewModel extends GetxController{

var dataList=[].obs;
var homeList=[].obs;
var favOfferData = [].obs;
var savefavOfferData = [].obs;
// Rx<RssFeed> feed1=RssFeed().obs;
RxList<RssItem> savfeed1=<RssItem>[].obs;
RxList<RssItem> feed1=<RssItem>[].obs;
 Future<List<PodcastModel>> getHomeDataByVM() async {
    List<PodcastModel> data =  await  homeDataListService("ur");
    dataList.value=data;
    return data;
  }
Future<List<HomeDataModel>> getHomeDataByViewModel() async {
  print("UYUU");
    List<HomeDataModel> data =  await  homeDataPodacst();
    dataList.value=data;
    print("UYUU");
    print(data);
    return data;
  }

  Future<RssFeed>getFeedByVM({required String feed}) async {


   var data=await loadFeedService(feed: feed);
   print("fetchData");
   print(data);
   savfeed1.value=data.items!;
   feed1.value=data.items!;
   return data;
  }

Future<List<dynamic>> onGetProductListFordb() async {
  print('poo');
  List<dynamic> data;
  data = await HiveService().getBoxes('fav');
  data.reversed;
  print('dta');
  print(data);
  favOfferData.value = data;
  savefavOfferData.value = data;
  return data;
}

checkDataExist(String id) {
  print("kkk");
  print(favOfferData.length);
  var islike;
  for (int i = 0; i < favOfferData.length; i++) {
    print('jjjj');
    print(favOfferData[i].guid);
    if (favOfferData[i].guid.toString() == id) {
      print("favttttrue");
      print('${favOfferData[i].guid == id}');
      return true;
    }
  }

  return false;
}


}