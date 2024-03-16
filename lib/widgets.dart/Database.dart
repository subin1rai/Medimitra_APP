import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .set(userInfoMap);
  }

  Future addMedicineItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getMedicineItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }

  Future addMedicinetoCart(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection('Cart')
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getMedicineCart(String id) async {
    return await FirebaseFirestore.instance
        .collection("user")
        .doc(id)
        .collection("Cart")
        .snapshots();
  }
  Future<void> removeMedicineFromCart(String id, String name) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(id)
          .collection("Cart")
          .doc(name)
          .delete();
    } catch (e) {
      print("Error removing item from cart: $e");
      // Handle error as per your requirement
    }
  }
}
