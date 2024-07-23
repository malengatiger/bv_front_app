import 'package:firebase_auth/firebase_auth.dart';

import '../util.dart';
import '../util/prefs.dart';
import 'list_service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth;
  final Prefs prefs;
  final ListService listService;

  AuthService(
      {required this.listService,
      required this.firebaseAuth,
      required this.prefs});

  Future signIn({required String email, required String password}) async {
    var cred = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (cred.user == null) {
      throw Exception('Sign in failed');
    }
    try {
      var token = await firebaseAuth.currentUser?.getIdToken();
      var user = await listService.getUserByEmail(email);
      prefs.saveUser(user);
      pp('🔵🔵 token: \n$token');
      return user;
    } catch (e) {
      pp(e);
    }
  }

  Future signInBidvestUser(
      {required String email, required String password}) async {
    var cred = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (cred.user == null) {
      throw Exception('Sign in failed');
    }
    try {
      var token = await firebaseAuth.currentUser?.getIdToken();
      var user = await listService.getBidvestUserByEmail(email);
      prefs.saveUser(user);
      pp('token: \n$token');
      return user;
    } catch (e) {
      pp(e);
    }
  }

  Future signInTemporary() async {
    if (firebaseAuth.currentUser != null) {
      var token = await firebaseAuth.currentUser?.getIdToken();
      pp(' 😡  😡  😡 ... We have a Token!!!!!');
      pp(' 😡  😡  😡 ... token: $token');
      return;
    }
    pp('🔵🔵.... Signing in as noliga@bidvest .....');
    await signInBidvestUser(email: 'noliga@bidvest.com', password: 'pass123');
  }
}
