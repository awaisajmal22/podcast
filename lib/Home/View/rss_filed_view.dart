// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/Home/Model/rss_item_model.dart';
import 'package:podcast/utlis/AppText/AppTextView.dart';
import 'package:podcast/utlis/hive_helper_sevices.dart';
import 'package:webfeed/webfeed.dart';

import '../../fire_base_data_view_model.dart';
import '../ViewModel/home_view_model.dart';

class RssFiledView extends StatefulWidget {
  RssItem rssItem;

  RssFiledView({
    Key? key,
    required this.rssItem,
  }) : super(key: key);

  @override
  State<RssFiledView> createState() => _RssFiledViewState();
}

class _RssFiledViewState extends State<RssFiledView> {
  var controller = Get.put(HomeViewModel());
  var controller1 = Get.put(FirebaseDataViewModel());
  var fav = false;
  bool isImage = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkImage(widget.rssItem.guid!);
    fav = controller.checkDataExist(widget.rssItem.guid.toString());
    print("Check fav Found");
    print(fav);
  }

  bool checkImage(String v) {
    for (int i = 0; i < controller1.dataFirebase.length; i++) {
      // var data = controller1.dataFirebase[i].podcastId.trim();
      // var dataLength = controller1.dataFirebase;
      // print("DataLength:$dataLength");
      print("Podcast Id");
      print(controller1.dataFirebase[i].podcastId);
      // print(v);
      if (controller1.dataFirebase[i].podcastId == v) {
        isImage = true;
      }
    }
    return false;
    // bool value = controller1.dataFirebase.contains(v);
    // print("Image Contains:$value");
    // return value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade50, offset: const Offset(0, 8))
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(widget
                                    .rssItem.itunes!.image?.href ==
                                null
                            ? "https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699"
                            : widget.rssItem.itunes!.image!.href.toString()),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12)),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: AppText.customText(title: widget.rssItem.title!)),
              InkWell(
                  onTap: () async {
                    if (fav) {
                      setState(() {
                        fav = !fav;
                      });
                      var value = await HiveService().deleteItemFromProduct(
                          widget.rssItem.guid.toString(), 'fav');
                      await HiveService().deleteItem(value, 'fav');
                      await controller.onGetProductListFordb();
                    } else {
                      RssItemModel data = RssItemModel(
                          guid: widget.rssItem.guid.toString(),
                          url: widget.rssItem.enclosure!.url!,
                          title: widget.rssItem.title.toString(),
                          href: widget.rssItem.itunes!.image?.href == null
                              ? "https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699"
                              : widget.rssItem.itunes!.image!.href.toString());
                      setState(() {
                        fav = !fav;
                      });

                      await HiveService().addBox(data, 'fav');

                      await controller.onGetProductListFordb();
                    }
                  },
                  child: fav
                      ? const Image(
                          image: AssetImage('image/navBar/Fav.png'),
                          //
                          height: 40,
                        )
                      : const Image(
                          image: AssetImage('image/navBar/fave.png'),
                          // color:  Colors.red,
                          height: 40,
                        )),
              isImage
                  ? const ImageIcon(
                      AssetImage('image/gallery.png'),
                      color: Colors.blueAccent,
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
