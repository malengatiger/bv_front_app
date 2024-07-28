import 'package:bv_front_app/data/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../util.dart';
import '../util/prefs.dart';
import 'data_service.dart';

class AuthService {
  final auth.FirebaseAuth firebaseAuth;
  final Prefs prefs;
  final DataService dataService;

  AuthService(
      {required this.dataService,
      required this.firebaseAuth,
      required this.prefs});

  OrganizationUser? organizationUser;
  BidvestUser? bidvestUser;
  static const mm = '🔑🔑🔑 AuthService  🔑🔑🔑';

  Future<UserType> _checkUserType(String email) async {
    var bUser = await dataService.getBidvestUserByEmail(email);
    if (bUser != null) {
      bidvestUser = bUser;
      return UserType.bidvestUserExists;
    }
    var orgUser = await dataService.getUserByEmail(email);
    if (orgUser != null) {
      organizationUser = orgUser;
      return UserType.organizationUserExists;
    } else {
      organizationUser = null;
      bidvestUser = null;
      return UserType.userDoesNotExist;
    }
  }

  Future signIn({required String email, required String password}) async {
    //todo - check the user; either Bidvest or Org
    var userType = await _checkUserType(email);
    switch (userType) {
      case UserType.userDoesNotExist:
        pp('$mm User does not exist on the database. Throwing a fit!');
        throw Exception('User does not exist on the database');
      case UserType.bidvestUserExists:
        return await _signInBidvestUser(email: email, password: password);
      case UserType.organizationUserExists:
        return await _signInOrganizationUser(email: email, password: password);
    }
  }

  Future<OrganizationUser> _signInOrganizationUser(
      {required String email, required String password}) async {
    pp('$mm _signInOrganizationUser: $email - $password');

    var cred = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (cred.user == null) {
      pp('$mm Password is fucked! sendPasswordResetEmail to user');
      await firebaseAuth.sendPasswordResetEmail(email: email);
      throw Exception(
          'Sign in failed. Check your email to reset your password');
    }
    try {
      var token = await firebaseAuth.currentUser?.getIdToken();
      prefs.saveOrganizationUser(organizationUser!);
      pp('🔵🔵 token: \n$token 🔵🔵🔵');
    } catch (e) {
      pp(e);
    }
    return organizationUser!;
  }

  Future<BidvestUser> _signInBidvestUser(
      {required String email, required String password}) async {
    pp('$mm _signInBidvestUser: $email - $password');

    var cred = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (cred.user == null) {
      pp('$mm Password is fucked! sendPasswordResetEmail to user');
      await firebaseAuth.sendPasswordResetEmail(email: email);
      throw Exception(
          'Sign in failed. Check your email to reset your password');
    } else {
      pp('$mm Cred user found: ${cred.user.toString()}, ... will get token');
    }
    try {
      if (firebaseAuth.currentUser != null) {
        var token = await firebaseAuth.currentUser?.getIdToken();
        prefs.saveBidvestUser(bidvestUser!);
        pp('$mm token: \n$token');
      } else {
        pp('$mm ... currentUser is null  👿 👿 👿');
      }
    } catch (e) {
      pp(e);
      throw Exception('Exception occurred. $e \n\nPlease try again ');
    }
    return bidvestUser!;
  }

  Future signInTemporary() async {
    //todo - REMOVE after dev test!!!  🔴 🔴 🔴
    if (firebaseAuth.currentUser != null) {
      var token = await firebaseAuth.currentUser?.getIdToken();
      pp('$mm  😡  😡  😡 ... We have a Token!!!!!');
      pp(' 😡 ... token: $token');
      return;
    }
    pp('🔵🔵.... Signing in as noliga@bidvest.com .....');
    await _signInBidvestUser(email: 'noliga@bidvest.com', password: 'pass123');
  }
}

enum UserType { bidvestUserExists, organizationUserExists, userDoesNotExist }
