

class FireBaseModelByData{

  String podcastId;
  List<CustomImage> images;


  FireBaseModelByData({required this.images,required this.podcastId});


  factory FireBaseModelByData.fromJson(Map<String, dynamic> json) => FireBaseModelByData(
    podcastId: json["podcastId"],
    images:CustomImage.fromJsonList(json["Image"]),

  );
  static List<FireBaseModelByData> fromJsonList(List<dynamic> json) =>
      json.map<FireBaseModelByData>((item) => FireBaseModelByData.fromJson(item)).toList();
}

class CustomImage{
  String time;
  String imgUrl;


  CustomImage({required this.time,required this.imgUrl});


  factory CustomImage.fromJson(Map<String, dynamic> json) => CustomImage(
    time: json["time"]??"",
    imgUrl: json["imageurl"]??"",



  );
  static List<CustomImage> fromJsonList(List<dynamic> json) =>
      json.map<CustomImage>((item) => CustomImage.fromJson(item)).toList();

}

