import 'package:bv_front_app/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util.dart';
import '../util/prefs.dart';
import 'data_service.dart';

final getIt = GetIt.instance;

class RegisterServices {
  //
  static Future registerServices(
      FirebaseAuth firebaseAuth, FirebaseFirestore firestore) async {
    pp(' 🌿🌿🌿🌿  Register Services ...');
    //
    var prefs = Prefs(await SharedPreferences.getInstance());
    var dataService = DataService(firestore);

    getIt.registerLazySingleton<AuthService>(() => AuthService(
        firebaseAuth: firebaseAuth, dataService: dataService, prefs: prefs));

    getIt.registerLazySingleton<DataService>(() => DataService(firestore));

    getIt.registerLazySingleton<Prefs>(() => prefs);

    pp(' 🌿🌿🌿🌿  3 Services registered as Lazy Singletons ... 🌹');
    pp(' 🌿🌿AuthService\n 🌿🌿DataService\n🌿🌿Prefs');
  }
}
