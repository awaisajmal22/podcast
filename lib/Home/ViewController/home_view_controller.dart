import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/Home/Model/home_data_model.dart';
import 'package:podcast/Home/Model/podcast_model.dart';
import 'package:podcast/Home/View/home_slider_view.dart';
import 'package:podcast/Home/View/home_title_view.dart';
import 'package:podcast/Home/ViewController/rss_list_view_controller.dart';
import 'package:podcast/Home/ViewModel/home_view_model.dart';
import 'package:podcast/audio_player.dart';
import 'package:podcast/fire_base_data_view_model.dart';
import 'package:podcast/rss_mode.dart';
import 'package:podcast/utlis/AppText/AppTextView.dart';
import 'package:podcast/utlis/Constants/AppConfig.dart';
import 'package:podcast/utlis/Constants/app_color.dart';
import 'package:webfeed/domain/rss_feed.dart';

import '../../utlis/AppBar/custom_app_bar.dart';

class HomeViewController extends StatefulWidget {
  const HomeViewController({Key? key}) : super(key: key);

  @override
  State<HomeViewController> createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  Future<List<HomeDataModel>>? fetchData;
  Future? fetchDataTy;
  var controller = HomeViewModel();
  var controller1=Get.put(FirebaseDataViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData = controller.getHomeDataByViewModel();
    controller1.getDataByFirebaseImages();
    controller.onGetProductListFordb();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              customAppBar(text: "Browser",context: context),
              Expanded(
                child: FutureBuilder<List<HomeDataModel>>(
                    future: fetchData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: AppConfig(context).height - 600,
                          width: AppConfig(context).width,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color:Colors.black,
                            ),
                          ),
                        );
                      } else if (snapshot.data![0].name == ''){
                        return Center(child: AppText.customText(title: "No Data Found"));
                      }
                      return snapshot.data!=null && snapshot.data!.isNotEmpty? ListView.builder(
                                      itemCount:snapshot.data!.length,
                                      scrollDirection:
                                          Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder: (context, ind)
                        {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10,bottom: 10),
                                child: AppText.customText(title:snapshot.data![ind].name,size: 20),
                              ),
                              // snapshot.data![ind].data.isEmpty?SizedBox(child: Text("No Found"),):
                               SizedBox(

                                height: 200,

                                child: ListView.builder(
                                  itemCount: snapshot.data![ind].data.length,
                                  scrollDirection:
                                  Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: EdgeInsets.only(
                                            left:
                                            10,
                                            right: index == 3
                                                ? 10
                                                : 10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>
                                                  RssListViewController(feedUrl:snapshot.data![ind].data[index].feedUrl, appbar:  snapshot.data![ind].data[index].trackName,)),
                                            );
                                          },
                                          child: HomeTileView(
                                              rssItem: snapshot.data![ind].data[index]),
                                        ));
                                  },
                                ),
                              ),
                            ],
                          );
                        }):Text('Category Not Found');
                    }

                                )

                        // ListView.builder(
                        // itemCount: controller.dataList.length,
                        // scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        // itemBuilder: (context, index) {
                        //   return Padding(
                        //       padding: EdgeInsets.only(
                        //           left: 10, right: index == 3 ? 10 : 10),
                        //       child: InkWell(
                        //           onTap: () {},
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               const SizedBox(
                        //                 width: 10,
                        //               ),
                        //               AppText.customText(
                        //                   title: controller
                        //                       .dataList[index].trackName,overflow:TextOverflow.fade),
                        //               const SizedBox(
                        //                 height: 10,
                        //               // ),
                        //               // FutureBuilder<RssFeed>(
                        //               //     future: controller.getFeedByVM(feed:controller.dataList[index].feedUrl),
                        //               //     builder: (context, snapshot) {
                        //               //       if (snapshot.connectionState ==
                        //               //           ConnectionState.waiting) {
                        //               //         return SizedBox(
                        //               //           height:
                        //               //               AppConfig(context).height -
                        //               //                   300,
                        //               //           width: AppConfig(context).width,
                        //               //           child: const Center(
                        //               //             child:
                        //               //                 CircularProgressIndicator(
                        //               //               color:
                        //               //                   AppColor.primarycolor,
                        //               //             ),
                        //               //           ),
                        //               //         );
                        //               //       }
                        //               //       return SizedBox(
                        //               //         height: 200,
                        //               //         child: ListView.builder(
                        //               //           itemCount:snapshot.data!.items!.length,
                        //               //           scrollDirection:
                        //               //               Axis.horizontal,
                        //               //           shrinkWrap: true,
                        //               //           itemBuilder: (context, index) {
                        //               //             return Padding(
                        //               //                 padding: EdgeInsets.only(
                        //               //                     left: 10,
                        //               //                     right: index == 3
                        //               //                         ? 10
                        //               //                         : 10),
                        //               //                 child: InkWell(
                        //               //                   onTap: () {
                        //               //                     Navigator.push(
                        //               //                       context,
                        //               //                       MaterialPageRoute(builder: (context) => CustomAudioPlayer(url:  snapshot.data!.items![index].enclosure!.url!, uid: snapshot.data!.items![index].guid.toString(), name: snapshot.data!.items![index].title.toString(),)),
                        //               //                     );
                        //               //                   },
                        //               //                   child:
                        //               //                        HomeTileView(rssItem: snapshot.data!.items![index],),
                        //               //                 ));
                        //               //           },
                        //               //         ),
                        //               //       );
                        //               //     }
                        //                   ),
                        //             ],
                        //           )));
                        // },
                      )

            ],
          ),
        ),
      ),
    );
  }
}
