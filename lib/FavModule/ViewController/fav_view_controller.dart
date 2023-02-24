import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/AudioPlayerModule/ViewController/audioplayer_view_controller.dart';
import 'package:podcast/FavModule/View/fav_tile_view.dart';
import 'package:podcast/Home/View/rss_filed_view.dart';
import 'package:podcast/Home/ViewModel/home_view_model.dart';
import 'package:podcast/audio_player.dart';
import 'package:podcast/utlis/AppBar/custom_app_bar.dart';
import 'package:podcast/utlis/Constants/AppConfig.dart';
import 'package:podcast/utlis/search_text_field.dart';

import '../../utlis/AppText/AppTextView.dart';

class FavViewController extends StatefulWidget {
  const FavViewController({Key? key}) : super(key: key);

  @override
  State<FavViewController> createState() => _FavViewControllerState();
}

class _FavViewControllerState extends State<FavViewController> {
  var controller = Get.put(HomeViewModel());
  TextEditingController search = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    controller.onGetProductListFordb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(text: "Favorite", context: context),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SearchTextField(
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.left,
              controller: search,
              keyboardType: TextInputType.text,
              hintText: 'Search here',
              onComplete: () {
                controller.favOfferData.value = controller.savefavOfferData
                    .where((p0) => p0.title
                        .toString()
                        .toLowerCase()
                        .contains(search.text.toLowerCase()))
                    .toList();
              },
            ),
          ),
          Expanded(
            child: Obx(() => controller.favOfferData.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage("image/category/no.png"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppText.customText(title: "No Favorite Found"),
                    ],
                  )
                : ListView.builder(

                  // controller: ScrollController(initialScrollOffset: double.maxFinite),

                    itemCount: controller.favOfferData.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final data = controller.favOfferData.length;
                      
                      return Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: index == 3 ? 10 : 10),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      //  CustomAudioPlayer(
                                      //       url: controller
                                      //           .favOfferData[data - index - 1].url,
                                      //       uid: controller
                                      //           .favOfferData[data - index - 1].guid,
                                      //       name: controller
                                      //           .favOfferData[data - index - 1].title,
                                      //     )
                                     AudioPlayerViewController(
                                      uid: controller.favOfferData[data - index - 1].guid,
                                            url: controller
                                                .favOfferData[data - index - 1].url,
                                            
                                            name: controller
                                                .favOfferData[data - index - 1].title,
                                          )
                                          ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FavTileView(
                                  image: controller.favOfferData[data - index - 1].href,
                                  name: controller.favOfferData[data - index - 1].title,
                                  url: controller.favOfferData[data - index - 1].url,
                                  uid: controller.favOfferData[data - index - 1].guid,
                                ),
                              )));
                    })),
          ),
        ],
      ),
    );
  }
}
