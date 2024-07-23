import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/user.dart';

class ListService {
  final FirebaseFirestore firebaseFirestore;

  ListService(this.firebaseFirestore);

  Future<User> getUserByEmail(String email) async {
    var u = await firebaseFirestore
        .collection('Users')
        .where('email', isEqualTo: email)
        .get();
    if (u.docs.isNotEmpty) {
      return User.fromJson(u.docs[0].data());
    } else {
      throw Exception('User not found');
    }
  }
  Future<User> getBidvestUserByEmail(String email) async {
    var u = await firebaseFirestore
        .collection('BidvestUsers')
        .where('email', isEqualTo: email)
        .get();
    if (u.docs.isNotEmpty) {
      return User.fromJson(u.docs[0].data());
    } else {
      throw Exception('User not found');
    }
  }
}
