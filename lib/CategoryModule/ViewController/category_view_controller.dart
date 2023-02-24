import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast/CategoryModule/View/category_view_tile.dart';
import 'package:podcast/CategoryModule/ViewController/category_detail_view_controller.dart';
import 'package:podcast/CategoryModule/ViewModel/category_view_model.dart';
import 'package:podcast/utlis/AppBar/custom_app_bar.dart';

class CategoryViewController extends StatelessWidget {
   CategoryViewController({Key? key}) : super(key: key);
     var controller=Get.put(CategoryViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          customAppBar(text: "Category", context: context),

          Expanded(
            child: GridView.builder(
              itemCount: controller.dataCategory.length,
              itemBuilder: ( context,  index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                        CategoryDetailViewController(url: controller.dataCategory[index].name,)
                    ));

                  },
                    child: categoryViewTile(categoryModel: controller.dataCategory[index] ));
              },
              gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10
              ),
              padding:const  EdgeInsets.all(20),
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
