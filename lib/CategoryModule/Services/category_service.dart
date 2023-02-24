


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:podcast/Home/Model/podcast_model.dart';

Future<List<PodcastModel>> categoryDataListService(url) async {
  // try {

  var response = await http.get(Uri.parse("https://itunes.apple.com/search?limit=50&media=podcast&term=${url}"));
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
  // }on SocketException {
  //
  //   return [];
  // } catch (e) {
  //
  //   return [];
  //
  // }
}