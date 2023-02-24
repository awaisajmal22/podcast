import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:podcast/firebase_data_model.dart';

getDataFirebase() async {
  List<FireBaseModelByData> fireBaseData;
  var querySnapshot =
      await FirebaseFirestore.instance.collection("podcast").get();
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  print("uyuyuy=====>$allData");
  print(allData.length);
  var data = allData;
  print(data);
  fireBaseData = FireBaseModelByData.fromJsonList(allData);
  print("Firebase length:${fireBaseData.length}");

  return fireBaseData;
}
