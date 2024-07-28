import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/user.dart';
import '../util.dart';

class DataService {
  final FirebaseFirestore firebaseFirestore;

  DataService(this.firebaseFirestore);

  static const mm = '♻️♻️♻️DataService  ♻️';

  Future<OrganizationUser?> getUserByEmail(String email) async {
    var u = await firebaseFirestore
        .collection('Users')
        .where('email', isEqualTo: email)
        .get();
    if (u.docs.isNotEmpty) {
      return OrganizationUser.fromJson(u.docs[0].data());
    } else {
      throw Exception('Organization User not found');
    }
  }

  Future<BidvestUser?> getBidvestUserByEmail(String email) async {
    var u = await firebaseFirestore
        .collection('BidvestUsers')
        .where('email', isEqualTo: email)
        .get();
    if (u.docs.isNotEmpty) {
      return BidvestUser.fromJson(u.docs[0].data());
    } else {
      throw Exception('Bidvest User not found');
    }
  }

  Future addDocument(String collection, dynamic data) async {
    var res = await firebaseFirestore.collection(collection).add(data);
    pp('$mm Firestore document added, path:  ♻️${res.path}');
    return res.path;
  }

  Future<List> getAllDocuments(String collection) async {
    var res = await firebaseFirestore.collection(collection).get();
    List list = [];
    for (var value in res.docs) {
      list.add(value.data());
    }
    pp('$mm Firestore documents found:  ♻️${list.length}');

    return list;
  }

  Future<List> getDocumentsByField(
      String collection, String field, String fieldValue) async {
    var res = await firebaseFirestore
        .collection(collection)
        .where(field, isEqualTo: fieldValue)
        .get();
    List list = [];
    for (var value in res.docs) {
      list.add(value.data());
    }
    pp('$mm Firestore documents found:  ♻️${list.length}');
    return list;
  }

  Future getDocumentByField(
      String collection, String field, String fieldValue) async {
    var res = await firebaseFirestore
        .collection(collection)
        .where(field, isEqualTo: fieldValue)
        .limit(1)
        .get();

    if (res.docs.isEmpty) {
      pp('$mm Firestore document not found:  👿 👿 👿 field: $field value: $fieldValue');
      return null;
    }
    var m = res.docs[0].data();
    pp('$mm Firestore document found:  ♻️$m');

    return m;
  }
}
