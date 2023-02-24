

import 'dart:convert';



class NewImageModel {
  int time;
  String url;
  NewImageModel({
    required this.time,
    required this.url
  });
}
// To parse this JSON data, do
//
//     final podcastImage = podcastImageFromJson(jsonString);





List<PodcastImage> podcastImageFromJson(String str) => List<PodcastImage>.from(json.decode(str).map((x) => PodcastImage.fromJson(x)));

String podcastImageToJson(List<PodcastImage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class PodcastImage {
    PodcastImage({
        required this.id,
        required this.userPodcastId,
        required this.time,
        required this.img,
        required this.userId,
        required this.v,
    });

    String id;
    String userPodcastId;
    String time;
    String img;
    String userId;
    int v;

    factory PodcastImage.fromJson(Map<String, dynamic> json) => PodcastImage(
        id: json["_id"],
        userPodcastId: json["userPodcastId"],
        time: json["time"],
        img: json["img"],
        userId: json["userId"],
        v: json["__v"],
    );
static List<PodcastImage> jsonToList(List<dynamic> emote) =>
      emote.map<PodcastImage>((item) => PodcastImage.fromJson(item)).toList();

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userPodcastId": userPodcastId,
        "time": time,
        "img": img,
        "userId": userId,
        "__v": v,
    };
}