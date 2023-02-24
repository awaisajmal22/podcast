import 'package:get/get.dart';
import 'package:podcast/service.dart';

class FirebaseDataViewModel extends GetxController {
  var dataFirebase = [].obs;
  var imageList = [].obs;

  getDataByFirebaseImages() async {
    var data = await getDataFirebase();
    print("Data:${data.length}");
    dataFirebase.value = data;
    print(data);
    return data;

    
  }
}
