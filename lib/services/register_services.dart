import 'package:bv_front_app/services/auth_service.dart';
import 'package:bv_front_app/services/list_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../util.dart';
import 'data_service.dart';
final getIt = GetIt.instance;

class RegisterServices {

  static Future registerServices(FirebaseAuth firebaseAuth, FirebaseFirestore firestore) async {
    pp(' 🌿🌿🌿🌿  Register Services ...');
      getIt.registerLazySingleton<AuthService>(() => AuthService(firebaseAuth));
      getIt.registerLazySingleton<DataService>(() => DataService(firestore));
      getIt.registerLazySingleton<ListService>(() => ListService(firestore));

      pp(' 🌿🌿🌿🌿  3 Services registered as Lazy Singletons ... 🌹');
  }
}
