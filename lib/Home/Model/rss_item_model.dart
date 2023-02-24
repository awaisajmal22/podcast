import 'package:hive/hive.dart';
part 'rss_item_model.g.dart';
@HiveType(typeId: 1)
class RssItemModel{
  @HiveField(0)
  final String guid;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String href;

  RssItemModel({required this.guid,required this.url,required this.title,required this.href});
}

// import 'package:webfeed/domain/rss_content.dart';
// import 'package:webfeed/domain/rss_item.dart';
// import 'package:webfeed/domain/rss_source.dart';
// import 'package:webfeed/webfeed.dart';
//
// class RssItemModel {
//   final String? title;
//   final String? description;
//   final String? link;
//
//   final List<RssCategoryModel>? categories;
//   final String? guid;
//   final DateTime? pubDate;
//   final String? author;
//   final String? comments;
//   final RssSourceModel? source;
//   final RssContentModel? content;
//   final MediaModel? media;
//   final RssEnclosure? enclosure;
//   final DublinCore? dc;
//   final Itunes? itunes;
//
//   RssItemModel({
//     this.title,
//     this.description,
//     this.link,
//     this.categories,
//     this.guid,
//     this.pubDate,
//     this.author,
//     this.comments,
//     this.source,
//     this.content,
//     this.media,
//     this.enclosure,
//     this.dc,
//     this.itunes,
//   });
//   factory RssItemModel.fromRssItemToRssItemModel(RssItem item) => RssItemModel(
//     title: item.title,
//     description: item.description,
//     link: item.link,
//     comments: item.comments,
//     author: item.author,
//     content:RssContentModel.fromRssContentToRssContentModel(item.content),
//     categories:RssCategoryModel.rssCategoryModelDecode(item.categories),
//
//
//
//   );
//
// }
//
// class RssCategoryModel {
//   final String? domain;
//   final String value;
//
//   RssCategoryModel(this.domain, this.value);
//   factory RssCategoryModel.fromRssCategoryToRssCategoryModel(RssCategory item) => RssCategoryModel(item.domain,item.value);
//
//   static List<RssCategoryModel> rssCategoryModelDecode(List<dynamic> ? emote) =>
//       emote!.map<RssCategoryModel>((item) => RssCategoryModel.fromRssCategoryToRssCategoryModel(item)).toList();
//
// }
// class RssSourceModel{
//   final String? url;
//   final String ?  value;
//
//   RssSourceModel(this.url,this.value);
//   factory RssSourceModel.fromRssSourceToRssSourceModel(RssSource item) => RssSourceModel(item.url,item.value);
//
// }
// class RssContentModel{
//   final String value;
//   Iterable<String> images;
//
//   RssContentModel({required this.value,required this.images});
//   factory RssContentModel.fromRssContentToRssContentModel(RssContent ? item) => RssContentModel(
//     value: item!.value,
//     images: item.images
//   );
//
//
//
//
// }
// class Scene {
//   final String? title;
//   final String? description;
//   final String? startTime;
//   final String? endTime;
//
//   Scene({
//     this.title,
//     this.description,
//     this.startTime,
//     this.endTime,
//   });
//
// }
// class PeerLink {
//   final String? type;
//   final String? href;
//   final String? value;
//
//   PeerLink({
//     this.type,
//     this.href,
//     this.value,
//   });
//
// }
// class Rights {
//   final String? status;
//
//   Rights({
//     this.status,
//   });
//
// }
// class MediaModel{
//   final GroupModel? group;
//   final List<ContentModel>? contents;
//   final List<Credit>? credits;
//   final Category? category;
//   final Rating? rating;
//   final Title? title;
//   final Description? description;
//   final String? keywords;
//   final List<Thumbnail>? thumbnails;
//   final Hash? hash;
//   final Player? player;
//   final Copyright? copyright;
//   final TextModel? text;
//   final Restriction? restriction;
//   final Community? community;
//   final List<String>? comments;
//   final Embed? embed;
//   final List<String>? responses;
//   final List<String>? backLinks;
//   final Status? status;
//   final List<Price>? prices;
//   final License? license;
//   final PeerLink? peerLink;
//   final Rights? rights;
//   final List<Scene>? scenes;
//
//   MediaModel({
//     this.group,
//     this.contents,
//     this.credits,
//     this.category,
//     this.rating,
//     this.title,
//     this.description,
//     this.keywords,
//     this.thumbnails,
//     this.hash,
//     this.player,
//     this.copyright,
//     this.text,
//     this.restriction,
//     this.community,
//     this.comments,
//     this.embed,
//     this.responses,
//     this.backLinks,
//     this.status,
//     this.prices,
//     this.license,
//     this.peerLink,
//     this.rights,
//     this.scenes,
//   });
//
//
// }
//
// class Price {
//   final double? price;
//   final String? type;
//   final String? info;
//   final String? currency;
//
//   Price({
//     this.price,
//     this.type,
//     this.info,
//     this.currency,
//   });
//
//
// }
// class License {
//   final String? type;
//   final String? href;
//   final String? value;
//
//   License({
//     this.type,
//     this.href,
//     this.value,
//   });
//
//
// }
// class Embed {
//   final String? url;
//   final int? width;
//   final int? height;
//   final List<Param>? params;
//
//   Embed({
//     this.url,
//     this.width,
//     this.height,
//     this.params,
//   });
//
//
// }
// class Param {
//   final String? name;
//   final String? value;
//
//   Param({
//     this.name,
//     this.value,
//   });
//
// }
// class Status {
//   final String? state;
//   final String? reason;
//
//   Status({
//     this.state,
//     this.reason,
//   });
// }
// class Restriction {
//   final String? relationship;
//   final String? type;
//   final String? value;
//
//   Restriction({
//     this.relationship,
//     this.type,
//     this.value,
//   });
//
// }
// class Community {
//   final StarRating? starRating;
//   final Statistics? statistics;
//   final Tags? tags;
//
//   Community({
//     this.starRating,
//     this.statistics,
//     this.tags,
//   });
//
//
// }
// class Tags {
//   final String? tags;
//   final int? weight;
//
//   Tags({
//     this.tags,
//     this.weight,
//   });
// }
// class Statistics {
//   final int? views;
//   final int? favorites;
//
//   Statistics({
//     this.views,
//     this.favorites,
//   });
//
// }
// class StarRating {
//   final double? average;
//   final int? count;
//   final int? min;
//   final int? max;
//
//   StarRating({
//     this.average,
//     this.count,
//     this.min,
//     this.max,
//   });
//
//
// }
// class Thumbnail {
//   final String? url;
//   final String? width;
//   final String? height;
//   final String? time;
//
//   Thumbnail({
//     this.url,
//     this.width,
//     this.height,
//     this.time,
//   });
//
// }
//
//
// class Hash {
//   final String? algo;
//   final String? value;
//
//   Hash({
//     this.algo,
//     this.value,
//   });
//
// }
//
// class Player {
//   final String? url;
//   final int? width;
//   final int? height;
//   final String? value;
//
//   Player({
//     this.url,
//     this.width,
//     this.height,
//     this.value,
//   });
//
// }
// class Copyright {
//   final String? url;
//   final String? value;
//
//   Copyright({
//     this.url,
//     this.value,
//   });

// }
// class TextModel {
//   final String? type;
//   final String? lang;
//   final String? start;
//   final String? end;
//   final String? value;
//
//   TextModel({
//     this.type,
//     this.lang,
//     this.start,
//     this.end,
//     this.value,
//   });
//
//
// }
// class Description {
//   final String? type;
//   final String? value;
//
//   Description({
//     this.type,
//     this.value,
//   });
//
// }
// class Rating {
//   final String? scheme;
//   final String? value;
//
//   Rating({
//     this.scheme,
//     this.value,
//   });
//
// }
// class Title {
//   final String? type;
//   final String? value;
//
//   Title({
//     this.type,
//     this.value,
//   });
//
// }
// class Category {
//   final String? scheme;
//   final String? label;
//   final String? value;
//
//   Category({
//     this.scheme,
//     this.label,
//     this.value,
//   });
//
//
// }
// class Credit {
//   final String? role;
//   final String? scheme;
//   final String? value;
//
//   Credit({
//     this.role,
//     this.scheme,
//     this.value,
//   });
//
// }
// class GroupModel{
//   final List<ContentModel>? contents;
//   final List<Credit>? credits;
//   final Category? category;
//   final Rating? rating;
//
//   GroupModel({
//     this.contents,
//     this.credits,
//     this.category,
//     this.rating,
//   });
//
//
// }
// class ContentModel {
//   final String? url;
//   final String? type;
//   final int? fileSize;
//   final String? medium;
//   final bool? isDefault;
//   final String? expression;
//   final int? bitrate;
//   final double? framerate;
//   final double? samplingrate;
//   final int? channels;
//   final int? duration;
//   final int? height;
//   final int? width;
//   final String? lang;
//
//   ContentModel({
//     this.url,
//     this.type,
//     this.fileSize,
//     this.medium,
//     this.isDefault,
//     this.expression,
//     this.bitrate,
//     this.framerate,
//     this.samplingrate,
//     this.channels,
//     this.duration,
//     this.height,
//     this.width,
//     this.lang,
//   });
//
//
// }
//
// class RssEnclosure {
//   final String? url;
//   final String? type;
//   final int? length;
//
//   RssEnclosure(this.url, this.type, this.length);
//
// }
// class DublinCore {
//   final String? title;
//   final String? description;
//   final String? creator;
//   final String? subject;
//   final String? publisher;
//   final String? contributor;
//   final DateTime? date;
//   final DateTime? created;
//   final DateTime? modified;
//   final String? type;
//   final String? format;
//   final String? identifier;
//   final String? source;
//   final String? language;
//   final String? relation;
//   final String? coverage;
//   final String? rights;
//
//   DublinCore({
//     this.title,
//     this.description,
//     this.creator,
//     this.subject,
//     this.publisher,
//     this.contributor,
//     this.date,
//     this.created,
//     this.modified,
//     this.type,
//     this.format,
//     this.identifier,
//     this.source,
//     this.language,
//     this.relation,
//     this.coverage,
//     this.rights,
//   });
//
//
// }
// class Itunes {
//   final String? author;
//   final String? summary;
//   final bool? explicit;
//   final String? title;
//   final String? subtitle;
//   final ItunesOwner? owner;
//   final List<String>? keywords;
//   final ItunesImage? image;
//   final List<ItunesCategory>? categories;
//   final ItunesType? type;
//   final String? newFeedUrl;
//   final bool? block;
//   final bool? complete;
//   final int? episode;
//   final int? season;
//   final Duration? duration;
//   final ItunesEpisodeType? episodeType;
//
//   Itunes({
//     this.author,
//     this.summary,
//     this.explicit,
//     this.title,
//     this.subtitle,
//     this.owner,
//     this.keywords,
//     this.image,
//     this.categories,
//     this.type,
//     this.newFeedUrl,
//     this.block,
//     this.complete,
//     this.episode,
//     this.season,
//     this.duration,
//     this.episodeType,
//   });
//
// }
// class ItunesOwner {
//   final String? name;
//   final String? email;
//
//   ItunesOwner({this.name, this.email});
//
//
// }
// class ItunesImage {
//   final String? href;
//
//   ItunesImage({this.href});
// }
// class ItunesCategory {
//   final String? category;
//   final List<String>? subCategories;
//
//   ItunesCategory({this.category, this.subCategories});
//
// }
// enum ItunesType { episodic, serial, unknown }
// enum ItunesEpisodeType { full, trailer, bonus, unknown }