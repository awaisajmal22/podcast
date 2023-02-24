


import 'dart:convert';

import '../model/image_model.dart';
import 'package:http/http.dart' as http;


Future<List<PodcastImage>> loadImageService({required String uid}) async {
  List<PodcastImage> imageModel = [];
// var _header = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYzk1MDkxOWQ4ZTMzM2JhZjNiNDNkOCIsImlhdCI6MTY3NTE0NjM2MH0.klGIVv9CCruze2P7zGYeUcWWoL2gWglZUVRHonG1Z5o';
var responce = await http.get(Uri.parse("http://143.110.182.106:8800/api/media/${uid}"));
print('UserPodcastId: ' + uid);
print(responce.body);
try{
if(responce.statusCode == 200){
imageModel = PodcastImage.jsonToList(jsonDecode(responce.body));
}
else {
  throw Exception('Error');
}
} catch (e){
  print(e);
}

// print(data);
// PodcastImage data = PodcastImage.fromJson(jsonDecode(responce.body));
// final data = json.decode(responce.body);
// final finalData = data.map((e) => PodcastImage.fromJson(e),).toList();
// print(data);
return imageModel;
}