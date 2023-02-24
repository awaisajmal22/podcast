


import 'package:flutter/material.dart';

class SliderHomeView extends StatefulWidget {

 const  SliderHomeView({Key? key}) : super(key: key);

  @override
  State<SliderHomeView> createState() => _SliderHomeViewState();
}

class _SliderHomeViewState extends State<SliderHomeView> {


  @override
  void initState() {
    // TODO: implement initState
    print("556GY");

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height /5,
        width:MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount:3,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding:  EdgeInsets.only(
                  left: 5,
                  right:index==3?1:10),
              child: InkWell(
                onTap: (){


                },
                child: Container(
                  height: MediaQuery.of(context).size.height  / 4.439,
                  width: MediaQuery.of(context).size.width /1.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage("image/uity.jpg"),
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            );
          },
        ));
  }
}