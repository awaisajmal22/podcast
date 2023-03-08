// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/Home/Model/rss_item_model.dart';
import 'package:podcast/Home/ViewModel/home_view_model.dart';
import 'package:podcast/utlis/AppText/AppTextView.dart';
import 'package:podcast/utlis/hive_helper_sevices.dart';
import 'package:webfeed/webfeed.dart';




class FavTileView extends StatefulWidget {
  String uid;
  String url;
  String image;
  String name;
  FavTileView({Key? key, required this.image, required this.uid,required this.name,required this.url}) : super(key: key);

  @override
  State<FavTileView> createState() => _FavTileViewState();
}

class _FavTileViewState extends State<FavTileView> {
  var controller =Get.put(HomeViewModel());
  var fav = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fav = controller.checkDataExist(widget.uid.toString());
    print("Fav");
    print(fav);

  }
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                        image: NetworkImage(widget.image== null
                            ? "https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699"
                            : widget.image.toString()),

                        fit: BoxFit.cover

                    ),
                    borderRadius: BorderRadius.circular(12)),
              ),
              const    SizedBox(width: 10,),
              Expanded(child: AppText.customText(title: widget.name, overflow: TextOverflow.ellipsis)),
              InkWell(
                  onTap: () async {
                    if (fav) {
                      setState(() {
                        fav = !fav;
                      });
                      var value = await HiveService()
                          .deleteItemFromProduct(
                          widget.uid.toString(), 'fav');
                      await HiveService().deleteItem(value, 'fav');
                     await controller.onGetProductListFordb();
                    } else {
                      RssItemModel data=RssItemModel(guid:  widget.uid.toString(), url:widget.url, title:  widget.name.toString(), href:widget.image==null
                          ? "https://www.indiewire.com/wp-content/uploads/2020/12/podcasting-gear.jpeg?resize=1024,699"
                          : widget.image.toString());
                      setState(() {
                        fav = !fav;
                      });

                      await HiveService().addBox(data, 'fav');
                     await controller.onGetProductListFordb();
                    }

                  },
                  child: fav?const Image(
                    image: AssetImage(
                        'image/navBar/Fav.png'),
                    //
                    height: 40,
                  ):const Image(
                    image: AssetImage(
                        'image/navBar/fave.png'),
                    // color:  Colors.red,
                    height: 40,
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}