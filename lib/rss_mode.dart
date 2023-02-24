import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podcast/AudioPlayerModule/ViewController/audioplayer_view_controller.dart';
import 'package:podcast/audio_player.dart';
import 'package:podcast/fire_base_data_view_model.dart';
import 'package:podcast/service.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'Home/Service/home_data_get.dart';

class RSSDemo extends StatefulWidget {
  String feedUrl;
  RSSDemo({required this.feedUrl}) : super();

  final String title = 'RSS Feed Demo';

  @override
  RSSDemoState createState() => RSSDemoState();
}

class RSSDemoState extends State<RSSDemo> {
  //
  var controller=Get.put(FirebaseDataViewModel());
  AudioPlayer _audioPlayer = AudioPlayer();
  static const String FEED_URL =
      'http://podrunner.wm.wizzard.tv/rss';
  RssFeed ? _feed;
  String ? _title;
  static const String loadingFeedMsg = 'Loading Feed...';
  static const String feedLoadErrorMsg = 'Error Loading Feed.';
  static const String feedOpenErrorMsg = 'Error Opening Feed.';
  static const String placeholderImg = 'image/imagert.png';
  GlobalKey<RefreshIndicatorState> ? _refreshKey;

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      return;
    }
    updateTitle(feedOpenErrorMsg);
  }

  load() async {
    updateTitle(loadingFeedMsg);
    loadFeed().then((result) {
      if (null == result || result
          .toString()
          .isEmpty) {
        updateTitle(feedLoadErrorMsg);
        return;
      }
      updateFeed(result);
      updateTitle(_feed!.title);
    });
  }

  loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(widget.feedUrl));
      return RssFeed.parse(response.body);
    } catch (e) {
      //
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);

    load();
    // getDataFirebase();
    controller.getDataByFirebaseImages();
  }

  title(title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  subtitle(subTitle) {
    return  Text(
      subTitle,
      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w100,color: Colors.orange),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  thumbnail(imageUrl) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset(placeholderImg),
        imageUrl: imageUrl,
        height: 50,
        width: 70,
        alignment: Alignment.center,
        fit: BoxFit.fill,
      ),
    );
  }

  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.grey,
      size: 30.0,
    );
  }

  list() {
    return ListView.builder(
      itemCount: _feed!.items!.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed!.items![index];
        return ListTile(
          title: title(item.title),
          subtitle: subtitle(item.guid),
          leading: thumbnail(item.itunes!.image?.href==null?"https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699":item.itunes!.image!.href),
          trailing: rightIcon(),
          contentPadding: EdgeInsets.all(5.0),
          onTap: () async {
            print("item.guid");
            print(item.guid.toString());

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => 
              // CustomAudioPlayer(url: item.enclosure!.url!, uid: item.guid.toString(), name: item.title.toString(),)
              AudioPlayerViewController(
                uid: item.guid.toString(),
                url: item.enclosure!.url!,  name: item.title.toString())
              ),
            );
          },
        );
      },
    );
  }

  isFeedEmpty() {
    return null == _feed || null == _feed!.items;
  }

  body() {
    return isFeedEmpty()
        ? Center(
      child: CircularProgressIndicator(),
    )
        : RefreshIndicator(
      key: _refreshKey,
      child: list(),
      onRefresh: () => load(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
      ),
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(_title!,style:const  TextStyle(color: Colors.black),),
          elevation: 0,
        ),
        body: body(),
      ));
  }
}