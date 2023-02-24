


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/Home/Model/podcast_model.dart';
import 'package:podcast/Home/View/home_title_view.dart';
import 'package:podcast/Home/ViewController/rss_list_view_controller.dart';
import 'package:podcast/utlis/AppBar/custom_app_bar.dart';
import 'package:podcast/utlis/AppText/AppTextView.dart';
import 'package:podcast/utlis/search_text_field.dart';

import '../ViewModel/category_view_model.dart';

class CategoryDetailViewController extends StatefulWidget {
  String  url;
   CategoryDetailViewController({Key? key,required this.url }) : super(key: key);

  @override
  State<CategoryDetailViewController> createState() => _CategoryDetailViewControllerState();
}

class _CategoryDetailViewControllerState extends State<CategoryDetailViewController> {

  Future<List<PodcastModel>> ? fetchData;
  var controller=CategoryViewModel();
  TextEditingController search = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData=controller.getCategoryDataByVM(url:widget.url);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(text: widget.url.toUpperCase(), context: context),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SearchTextField(
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.left,
              controller: search,
              keyboardType: TextInputType.text,
              
              hintText: 'Search here',
              onComplete: () {
                controller.dataList.value = controller.savdataList
                    .where((p0) => p0.trackName
                    .toString()
                    .toLowerCase()
                    .contains(search.text.toLowerCase()))
                    .toList();
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<PodcastModel>>(
              future: fetchData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                return Obx(()=>controller.dataList.isEmpty?AppText.customText(title: "No Data Found"): GridView.builder(
                  itemCount:  controller.dataList.length,
                  itemBuilder: ( context,  index) {
                    return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                RssListViewController(feedUrl: controller.dataList.value[index].feedUrl, appbar:  controller.dataList.value[index].trackName,)),
                          );

                        },
                        child: HomeTileView(rssItem: controller.dataList.value[index],height: 120,));
                  },
                  gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20
                  ),
                  padding:const  EdgeInsets.all(14),
                  shrinkWrap: true,
                ));
              }
            ),
          )
        ],
      ),
    );
  }
}
