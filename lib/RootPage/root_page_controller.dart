import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:podcast/CategoryModule/ViewController/category_view_controller.dart';
import 'package:podcast/FavModule/ViewController/fav_view_controller.dart';
import 'package:podcast/Home/ViewController/home_view_controller.dart';
import 'package:podcast/Home/ViewModel/home_view_model.dart';
import 'package:podcast/utlis/Constants/app_color.dart';


BuildContext? testContext;

class RootPageNavBar extends StatefulWidget {
  final int currentIndex;

  // final BuildContext menuScreenContext;
  const RootPageNavBar({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  _RootPageNavBarState createState() => _RootPageNavBarState();
}

class _RootPageNavBarState extends State<RootPageNavBar> {
  var controller=Get.put(HomeViewModel());
  late PersistentTabController _controller;
  bool? _hideNavBar;
  int currentItem = 0;
  dynamic getToken = "";

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
    controller.onGetProductListFordb();

    setState(() {
      currentItem = widget.currentIndex;
    });
  }

//

  List<Widget> _buildScreens() {
    return  [
      const HomeViewController(),
        CategoryViewController(),
      const  FavViewController(),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          "image/navBar/home.png",
          color: Colors.black,
          height: 25,
        ),
        inactiveIcon: Image.asset(
          "image/navBar/home.png",
          color:  Colors.grey,
          height: 25,
        ),
        title: "Browser".tr,
        activeColorPrimary:Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          "image/navBar/catgory.png",
          color: Colors.black,
          height: 25,
        ),
        inactiveIcon: Image.asset(
          "image/navBar/catgory.png",
          color:  Colors.grey,
          height: 25,
        ),
        title: "Category".tr,
        activeColorPrimary:Colors.black,
        inactiveColorPrimary:Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          "image/navBar/heart.png",
          color: Colors.black,
          height: 25,
        ),
        inactiveIcon: Image.asset(
          "image/navBar/heart.png",
          color:  Colors.grey,
          height: 25,
        ),
        title: "Favorite".tr,
        activeColorPrimary:Colors.black,
        inactiveColorPrimary:Colors.grey,
      ),

    ];
  }

  bool _keyboardVisible = false;
  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Container (
      color: Colors.white,
      child: SafeArea(
        // top: false,
        right: false,
        left: false,
        child: Scaffold(
          backgroundColor:Colors.white,
          bottomNavigationBar: PersistentTabView(context,
              controller: _controller,
              screens: _buildScreens(),
              items: _navBarsItems(),
              confineInSafeArea: false,
              backgroundColor: Colors.white,
              handleAndroidBackButtonPress: true,
              resizeToAvoidBottomInset: true,
             
              stateManagement: false,
              navBarHeight:65,
              bottomScreenMargin: _keyboardVisible ? 0.0 : 65.0,
              hideNavigationBarWhenKeyboardShows: true,
              margin: EdgeInsets.zero,
              popActionScreens: PopActionScreensType.all,
              selectedTabScreenContext: (context) {
            testContext = context;
          },
              hideNavigationBar: _hideNavBar,
              popAllScreensOnTapOfSelectedTab: true,
              navBarStyle: NavBarStyle.style6// Choose the nav bar style with this property
              ),
        ),
      ),
    );
  }
}
