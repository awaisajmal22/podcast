import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:podcast/AudioPlayerModule/View/component/back_button.dart';
import 'package:podcast/AudioPlayerModule/View/component/backdrop_filter_image.dart';
import 'package:podcast/AudioPlayerModule/View/component/courselslider.dart';
// import 'package:podcast/AudioPlayerModule/View/component/music_image.dart';
import 'package:podcast/AudioPlayerModule/View/component/music_title.dart';
import 'package:podcast/AudioPlayerModule/View/component/player_button.dart';
import 'package:podcast/AudioPlayerModule/View/component/progress_bar.dart';
import 'package:podcast/AudioPlayerModule/ViewModel/audioplayer_model.dart';
import 'package:podcast/AudioPlayerModule/model/image_model.dart';
import 'package:podcast/utlis/Constants/app_color.dart';

import '../../page_manager.dart';
import '../../utlis/Constants/AppConfig.dart';
import '../sevices/podcast_image_services.dart';

class AudioPlayerViewController extends StatefulWidget {
  AudioPlayerViewController(
      {required this.url, required this.name, required this.uid});
  String url;
  String uid;
  String name;

  @override
  State<AudioPlayerViewController> createState() =>
      _AudioPlayerViewControllerState();
}

class _AudioPlayerViewControllerState extends State<AudioPlayerViewController> with WidgetsBindingObserver {
  late final PageManager _pageManager;
 
  final controller = Get.put(GetImageController());
  // RxBool check = false.obs;
   @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
     _pageManager.pause();
    }else{
      print(state.toString());
    }
  }
  @override
  void initState() {
    // controller.getUid(widget.uid);
    controller.updateList(uId: widget.uid);
    
    // TODO: implement initState
    super.initState();
    _pageManager = PageManager(urlBy: widget.url);
    WidgetsBinding.instance.addObserver(this);
  }
 
  @override
  void dispose() {
    // TODO: implement dispose
    _pageManager.dispose();
    super.dispose();
    controller.imageList.clear();
    controller.newList.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                backDropFilterImage(context),
                ClipRRect(
                  // Clip it cleanly.
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                        height: AppConfig(context).height /
                            1.9 ,// color: Colors.grey.withOpacity(0.1),

                        ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 10,
                  right: 10,
                  bottom: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    width: AppConfig(context).width / 1.1,
                    height: AppConfig(context).height / 1.9,
                    child: Material(
                     
                      color: Colors.transparent,
                        child: ValueListenableBuilder<ProgressBarState>(
                          
                            valueListenable: _pageManager.progressNotifier,
                            builder: (_, value, __) {
                              return CarouselSliderTile(
                                uid: widget.uid,
                                val: value.current.inSeconds,
                              );
                            })),
                  ),
                ),
                Positioned(top: 5, left: 10, child: backButton(context, onBack: (){
                  // controller.newList.clear();
                  // controller.imageList.clear();
                  // controller.imageModelList.clear();
                  // loadImageService(uid: widget.uid).
        Navigator.of(context).pop();

                }))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: musicTitle(name: widget.name),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ValueListenableBuilder<ProgressBarState>(
                  valueListenable: _pageManager.progressNotifier,
                  builder: (_, value, __) {
                    return progressBar(
                        buffered: value.buffered,
                        progress: value.current,
                        total: value.total,
                        onSeek: _pageManager.seek);
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder<ProgressBarState>(
                        valueListenable: _pageManager.progressNotifier,
                        builder: (_, value, __) {
                          return playerButton(
                              onPressed: () {
                                  _pageManager.seek(Duration(
                                    seconds: value.current.inSeconds - 10));
               

                                    if(value.current <= Duration(seconds: 10)){
                                      setState(() {
                                        _pageManager.seek(Duration(
                                        seconds: 0
                                      ));
                                      });
                                      
                                    }
                              },
                              iconUrl: 'image/player/previous.png',
                              iconSize: 32.0);
                        }),
                    const SizedBox(
                      width: 20,
                    ),
                    ValueListenableBuilder<ButtonState>(
                        valueListenable: _pageManager.buttonNotifier,
                        builder: (_, value, ___) {
                          switch (value) {
                            case ButtonState.loading:
                              return Container(
                                height: 64,
                                width: 64,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              );
                            case ButtonState.paused:
                              return playerButton(
                                  onPressed: () {
                                    _pageManager.play();
                                  },
                                  iconUrl: 'image/player/play.png',
                                  iconSize: 64);
                            case ButtonState.playing:
                              return playerButton(
                                  onPressed: _pageManager.pause,
                                  iconUrl: 'image/player/pause.png',
                                  iconSize: 64);
                          }
                        }),
                    SizedBox(
                      width: 20,
                    ),
                    ValueListenableBuilder<ProgressBarState>(
                        valueListenable: _pageManager.progressNotifier,
                        builder: (_, value, __) {
                          return playerButton(
                              onPressed: (){
                                _pageManager.seek(Duration(
                                    seconds: value.current.inSeconds + 10));
                                    if(value.current >= value.total - Duration(seconds: 10)){
                                      
                                        _pageManager.seek(Duration(
                                        seconds: 0
                                      ));
                                      
                                    }
                              },
                              iconUrl: 'image/player/forward.png',
                              iconSize: 32);
                        })
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
