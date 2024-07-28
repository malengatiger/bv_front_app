import 'package:bv_front_app/ui/landing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../services/auth_service.dart';
import '../../util.dart';
import '../../util/prefs.dart';

class OrganizationLandingPage extends StatefulWidget {
  const OrganizationLandingPage({super.key});

  @override
  State<OrganizationLandingPage> createState() => _OrganizationLandingPageState();
}

class _OrganizationLandingPageState extends State<OrganizationLandingPage> {
  Prefs prefs = GetIt.instance<Prefs>();
  AuthService authService = GetIt.instance<AuthService>();
  late UserBag  userBag;
  static const mm = '🔴 🔴OrganizationLandingPage ';
  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  void _checkStatus() async {
    var auth = FirebaseAuth.instance;
    //todo -  🔴 🔴 🔴REMOVE after dev, do not forget!!!!
    await authService.signInTemporary();
    userBag = prefs.getUser();
    if (auth.currentUser != null) {
      _navigateToDashboard();
      return;
    }
    pp('$mm .... User needs to pony up! ...');
  }
  _navigateToDashboard() {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Organization Landing Page'),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            ScreenTypeLayout.builder(
              mobile: (ctx) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        SignUpActions(onRegister: () {}, onSignIn: () {}),
                        Expanded(child: Container(color: Colors.red)),
                      ],
                    )
                  ],
                );
              },
              tablet: (ctx) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        SignUpActions(onRegister: () {}, onSignIn: () {}),
                        Expanded(child: Container(color: Colors.yellow)),
                      ],
                    )
                  ],
                );
              },
              desktop: (ctx) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        SignUpActions(onRegister: () {}, onSignIn: () {}),
                        Expanded(child: Container(color: Colors.teal)),
                      ],
                    )
                  ],
                );
              },
            ),
          ],
        )));
  }
}
