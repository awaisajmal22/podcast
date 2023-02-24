import 'package:hive/hive.dart';

class HiveService {
  isExists({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  addBoxes<T>(List<T> items, String boxName) async {
    print("adding boxes");
    final openBox = await Hive.openBox(boxName);
    for (var item in items) {
      openBox.add(item);
    }
  }
  deleteBox(String boxName) async {
    print("Delete Clear");
    final box = await Hive.box(boxName);

   await box.clear();
    print("Box Clear");
    print(box.length);
  }

  addBox(item, String boxName) async {
    print("adding boxes");
    final openBox = await Hive.openBox(boxName);
    openBox.add(item);

  }

  getBoxes<T>(String boxName) async {
    List<T> boxList = <T>[];
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }
    return boxList;
  }

  deleteItem(int index, String boxName) async {
    final box = await Hive.openBox(boxName);
    box.deleteAt(index);
  }

  deleteItemFromProduct(String id, String boxName) async {
    List<dynamic> boxList = [];
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }
    List<dynamic> deleteFav = boxList;
    for (int i = 0; i < deleteFav.length; i++) {
      if (deleteFav[i].guid == id) {
        print('delete sussc');
        return i;
      }
    }
    return 0;
  }
}
