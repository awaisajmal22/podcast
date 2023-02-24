// To parse this JSON data, do
//
//     final podcastModel = podcastModelFromJson(jsonString);

import 'dart:convert';

PodcastModel podcastModelFromJson(String str) => PodcastModel.fromJson(json.decode(str));

String podcastModelToJson(PodcastModel data) => json.encode(data.toJson());





class PodcastModel {
  PodcastModel({
    required this.wrapperType,
    required this.kind,
    required this.artistId,
    required this.collectionId,
    required this.trackId,
    required this.artistName,
    required  this.collectionName,
    required this.trackName,
    required this.collectionCensoredName,
    required this.trackCensoredName,
    required this.artistViewUrl,
    required this.collectionViewUrl,
    required this.feedUrl,
    required this.trackViewUrl,
    required this.artworkUrl30,
    required this.artworkUrl60,
    required this.artworkUrl100,
    required  this.collectionPrice,
    required  this.trackPrice,
    required  this.trackRentalPrice,
    required  this.collectionHdPrice,
    required  this.trackHdPrice,
    required  this.trackHdRentalPrice,
    required  this.releaseDate,
    required  this.collectionExplicitness,
    required  this.trackExplicitness,
    required  this.trackCount,
    required this.country,
    required this.currency,
    required this.primaryGenreName,
    required this.contentAdvisoryRating,
    required  this.artworkUrl600,
    required  this.genreIds,
    required   this.genres,
  });

  String wrapperType;
  String kind;
  int artistId;
  int collectionId;
  int trackId;
  String artistName;
  String collectionName;
  String trackName;
  String collectionCensoredName;
  String trackCensoredName;
  String artistViewUrl;
  String collectionViewUrl;
  String feedUrl;
  String trackViewUrl;
  String artworkUrl30;
  String artworkUrl60;
  String artworkUrl100;
  double collectionPrice;
  double trackPrice;
  int trackRentalPrice;
  int collectionHdPrice;
  int trackHdPrice;
  int trackHdRentalPrice;
  DateTime releaseDate;
  String collectionExplicitness;
  String trackExplicitness;
  int trackCount;
  String country;
  String currency;
  String primaryGenreName;
  String contentAdvisoryRating;
  String artworkUrl600;
  List<String> genreIds;
  List<String> genres;

  factory PodcastModel.fromJson(Map<String, dynamic> json) => PodcastModel(
    wrapperType: json["wrapperType"]??"",
    kind: json["kind"]??"",
    artistId: json["artistId"]??0,
    collectionId: json["collectionId"]??0,
    trackId: json["trackId"]??0,
    artistName: json["artistName"]??"",
    collectionName: json["collectionName"]??"",
    trackName: json["trackName"]??"",
    collectionCensoredName: json["collectionCensoredName"]??"",
    trackCensoredName: json["trackCensoredName"]??"",
    artistViewUrl: json["artistViewUrl"]??"",
    collectionViewUrl: json["collectionViewUrl"]??"",
    feedUrl: json["feedUrl"]??"https://podcasts.files.bbci.co.uk/p02nq0gn.rss",
    trackViewUrl: json["trackViewUrl"]??"",
    artworkUrl30: json["artworkUrl30"]??"",
    artworkUrl60: json["artworkUrl60"]??"",
    artworkUrl100: json["artworkUrl100"]??"",
    collectionPrice: json["collectionPrice"]??0.0,
    trackPrice: json["trackPrice"]??0.0,
    trackRentalPrice: json["trackRentalPrice"]??0,
    collectionHdPrice: json["collectionHdPrice"]??0,
    trackHdPrice: json["trackHdPrice"]??0,
    trackHdRentalPrice: json["trackHdRentalPrice"]??0,
    releaseDate: DateTime.parse(json["releaseDate"]),
    collectionExplicitness: json["collectionExplicitness"]??"",
    trackExplicitness: json["trackExplicitness"]??"",
    trackCount: json["trackCount"]??0,
    country: json["country"]??"",
    currency: json["currency"]??"",
    primaryGenreName: json["primaryGenreName"]??"",
    contentAdvisoryRating: json["contentAdvisoryRating"]??"",
    artworkUrl600: json["artworkUrl600"]??"",
    genreIds: List<String>.from(json["genreIds"].map((x) => x)),
    genres: List<String>.from(json["genres"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "wrapperType": wrapperType,
    "kind": kind,
    "artistId": artistId,
    "collectionId": collectionId,
    "trackId": trackId,
    "artistName": artistName,
    "collectionName": collectionName,
    "trackName": trackName,
    "collectionCensoredName": collectionCensoredName,
    "trackCensoredName": trackCensoredName,
    "artistViewUrl": artistViewUrl,
    "collectionViewUrl": collectionViewUrl,
    "feedUrl": feedUrl,
    "trackViewUrl": trackViewUrl,
    "artworkUrl30": artworkUrl30,
    "artworkUrl60": artworkUrl60,
    "artworkUrl100": artworkUrl100,
    "collectionPrice": collectionPrice,
    "trackPrice": trackPrice,
    "trackRentalPrice": trackRentalPrice,
    "collectionHdPrice": collectionHdPrice,
    "trackHdPrice": trackHdPrice,
    "trackHdRentalPrice": trackHdRentalPrice,
    "releaseDate": releaseDate.toIso8601String(),
    "collectionExplicitness": collectionExplicitness,
    "trackExplicitness": trackExplicitness,
    "trackCount": trackCount,
    "country": country,
    "currency": currency,
    "primaryGenreName": primaryGenreName,
    "contentAdvisoryRating": contentAdvisoryRating,
    "artworkUrl600": artworkUrl600,
    "genreIds": List<dynamic>.from(genreIds.map((x) => x)),
    "genres": List<dynamic>.from(genres.map((x) => x)),
  };

 static List<PodcastModel> podcastModelDecode(List<dynamic> emote) =>
      emote.map<PodcastModel>((item) => PodcastModel.fromJson(item)).toList();
}
