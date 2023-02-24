



import 'package:flutter/material.dart';
import 'package:podcast/Home/Model/podcast_model.dart';
import 'package:podcast/utlis/AppText/AppTextView.dart';
import 'package:webfeed/domain/rss_item.dart';

class HomeTileView extends StatelessWidget {
  PodcastModel rssItem;
  double height;
   HomeTileView({Key? key,required this.rssItem,this.height=140 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      width: MediaQuery.of(context).size.width/2.5,
      // color: Colors.orange,
      child: Column(
        children:  [
          Container(
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10)
              ),
              image:rssItem.artworkUrl600.isEmpty ?const  DecorationImage(image:AssetImage('image/uity.jpg'),fit: BoxFit.cover ):DecorationImage(image:NetworkImage(rssItem.artworkUrl600),fit: BoxFit.cover )
            ),
            height:height,


          ),
         const SizedBox(height: 5,),
          Align(
              alignment: Alignment.topLeft,
              child: AppText.customText(title: rssItem.trackName.toUpperCase(),overflow: TextOverflow.ellipsis,fontWeight:FontWeight.w500,size: 12)),
          const SizedBox(height: 5,),
          Align(
            alignment: Alignment.topLeft,
              child: AppText.customText(title:rssItem.artistName,overflow: TextOverflow.ellipsis,fontWeight:FontWeight.normal,size: 10,alignment:TextAlign.start))

        ],
      ),
    );
  }
}
