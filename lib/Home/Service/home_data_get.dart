

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:podcast/Home/Model/home_data_model.dart';
import 'dart:io';

import 'package:podcast/Home/Model/podcast_model.dart';

Future<List<PodcastModel>> homeDataListService(url) async {
  try {
  print('statusCode5');
    var response = await http.get(Uri.parse(url));

    print('statusCode');
    print(response.statusCode);
    print("jsonDecode(response.body)");
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)["results"]);
     List<PodcastModel> data=PodcastModel.podcastModelDecode(jsonDecode(response.body)["results"]);
      print(data);
      print("Success");
      return data;
    } else {

      // print(jsonDecode(response.body));
      return [];

    }
  }on SocketException {

    return [];
  } catch (e) {
    print(e);

    return [];

  }
}
Future<List<HomeDataModel>> homeDataPodacst() async {
   List<HomeDataModel> uy=[];
   print("tempyuu1");
  List<PodcastModel> temp= await  homeDataListService("https://itunes.apple.com/search?limit=20&media=podcast&term=news");
  print("tempyuu");
  print(temp);
   uy.add(HomeDataModel(name: temp.isEmpty ? '':"News", data:temp));
   List<PodcastModel> temp1=await  homeDataListService("https://itunes.apple.com/search?limit=20&media=podcast&term=music");
   uy.add(HomeDataModel(name: temp1.isEmpty ?'': "Music", data:temp1 ));
   List<PodcastModel> temp2=await  homeDataListService("https://itunes.apple.com/search?limit=20&media=podcast&term=comedy");
   uy.add(HomeDataModel(name: temp2.isEmpty ? '': "Comedy", data:temp2));
   List<PodcastModel> temp3=await  homeDataListService("https://itunes.apple.com/search?limit=20&media=podcast&term=sport");
   uy.add(HomeDataModel(name: temp3.isEmpty ? '':"Sports", data:temp3));
   List<PodcastModel> temp4=await  homeDataListService("https://itunes.apple.com/search?limit=20&media=podcast&term=talkshow");

   uy.add(HomeDataModel(name: temp4.isEmpty ? '':"Talkshow", data:temp4));
   List<PodcastModel> temp5=await  homeDataListService("https://itunes.apple.com/search?limit=20&media=podcast&term=world");
   uy.add(HomeDataModel(name: temp5.isEmpty ? '':"World", data:temp5));





  return uy;
}