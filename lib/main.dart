import 'package:bv_front_app/services/register_services.dart';
import 'package:bv_front_app/ui/surveys/survey_page.dart';
import 'package:bv_front_app/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
//  😡 😡 😡 😡 😡 POPI Act: Data Subject Rights  😡 https://www.popiact-compliance.co.za/popia-information/10-data-subject-rights
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pp('\n\n$mx DefaultFirebaseOptions.currentPlatform: '
      '\n${DefaultFirebaseOptions.currentPlatform.toString()}');
  //
  firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  pp('$mx '
      ' Firebase App has been initialized: 🍎${firebaseApp.name}, checking for authed current user\n');

  fbAuthedUser = fb.FirebaseAuth.instance.currentUser;
  if (fbAuthedUser != null) {
    pp('$mx fbAuthUser: ${fbAuthedUser!.uid}');
    pp("$mx .... fbAuthUser is cool! ........ on to the party!! 🍎🍎 \n ${await fbAuthedUser?.getIdToken()}");
  } else {
    pp('$mx fbAuthUser: is null. 👿👿👿👿Need to sign up or in. 👿Authenticate the app!');
  }
  await RegisterServices.registerServices(
      FirebaseAuth.instance, FirebaseFirestore.instance);
  runApp(const BidvestApp());
}

late FirebaseApp firebaseApp;
fb.User? fbAuthedUser;
const mx = '🔵🔵🔵🔵 Bidvest Supplier Programme App 🔵🔵';

class BidvestApp extends StatelessWidget {
  const BidvestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bidvest Suppliers Programme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LandingPage(),
      home: const SurveyPage(),
    );
  }
}
