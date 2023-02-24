import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/AudioPlayerModule/ViewController/audioplayer_view_controller.dart';
import 'package:podcast/Home/View/rss_filed_view.dart';
import 'package:podcast/Home/ViewModel/home_view_model.dart';
import 'package:podcast/audio_player.dart';
import 'package:podcast/fire_base_data_view_model.dart';
import 'package:podcast/utlis/AppBar/custom_app_bar.dart';
import 'package:podcast/utlis/AppText/AppTextView.dart';
import 'package:podcast/utlis/Constants/AppConfig.dart';
import 'package:podcast/utlis/Constants/app_color.dart';
import 'package:podcast/utlis/search_text_field.dart';
import 'package:webfeed/domain/rss_feed.dart';

class RssListViewController extends StatefulWidget {
  String appbar;
  String feedUrl;

  RssListViewController({Key? key, required this.appbar, required this.feedUrl})
      : super(key: key);

  @override
  State<RssListViewController> createState() => _RssListViewControllerState();
}

class _RssListViewControllerState extends State<RssListViewController> {
  Future<RssFeed>? fetchData;
  var controller = Get.put(HomeViewModel());
  var controller1 = Get.put(FirebaseDataViewModel());
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData = controller.getFeedByVM(feed: widget.feedUrl);

    controller1.getDataByFirebaseImages();
    print("images data:${controller1.dataFirebase.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        customAppBar(text: widget.appbar, context: context),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SearchTextField(
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.left,
            controller: search,
            keyboardType: TextInputType.text,
            hintText: 'Search here',
            onComplete: () {
              print(controller.feed1.value.length);
              setState(() {
                controller.feed1.value = controller.savfeed1.value
                    .where((p0) => p0.title
                        .toString()
                        .toLowerCase()
                        .contains(search.text.toLowerCase()))
                    .toList();
                controller.feed1.refresh();
              });
              print("hhhk");

              print(" controller.feed1.value.items");

              print(controller.feed1.value.length);
            },
          ),
        ),
        Expanded(
          child: FutureBuilder<RssFeed>(
              future: fetchData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: AppConfig(context).height - 300,
                    width: AppConfig(context).width,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                return Obx(() =>controller.feed1.value.isEmpty?AppText.customText(title: "No Data Found") :ListView.builder(

                      itemCount: controller.feed1.value.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: index == 3 ? 10 : 10),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => 
                                        // CustomAudioPlayer(
                                        //       url: controller.feed1.value[index]
                                        //           .enclosure!.url!,
                                        //       uid: controller
                                        //           .feed1.value[index].guid
                                        //           .toString(),
                                        //       name: controller
                                        //           .feed1.value[index].title
                                        //           .toString(),
                                        //     )
                                        AudioPlayerViewController(
                                          uid: controller.feed1.value[index].guid.toString(),
                                          url: controller.feed1.value[index].enclosure!.url!, name: controller
                                                  .feed1.value[index].title
                                                  .toString())
                                            ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RssFiledView(
                                    rssItem: controller.feed1.value[index],
                                  ),
                                )));
                      },
                    ));
              }),
        )
      ],
    ));
  }
}
