import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../services/auth_service.dart';
import '../util.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const mm = '🌍🌍🌍LandingPage: ';

  AuthService authService = GetIt.instance<AuthService>();
  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  void _checkStatus() async {
    var auth = FirebaseAuth.instance;
    //todo - REMOVE after dev
    await authService.signInTemporary();
    if (auth.currentUser != null) {
      _navigateToDashboard();
      return;
    }
    pp('$mm User needs to pony up! ...');
  }

  _navigateToDashboard() {}

  _navigateToRegister() {}

  _navigateToSignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bidvest Supplier Programme')),
      body: SafeArea(
        child: Stack(
          children: [
            ScreenTypeLayout.builder(
              mobile: (ctx) {
                return Stack(children: [
                  Column(
                    children: [
                      Actions(onRegister: () {
                        _navigateToRegister();
                      }, onSignIn: () {
                        _navigateToSignIn();
                      }),
                      Expanded(child: Container(color: Colors.blue)),
                    ],
                  )
                ]);
              },
              tablet: (ctx) {
                return Stack(children: [
                  Column(
                    children: [
                      Actions(onRegister: () {
                        _navigateToRegister();
                      }, onSignIn: () {
                        _navigateToSignIn();
                      }),
                      Expanded(child: Container(color: Colors.red)),
                    ],
                  )
                ]);
              },
              desktop: (ctx) {
                return Stack(children: [
                  Column(
                    children: [
                      Actions(onRegister: () {
                        _navigateToRegister();
                      }, onSignIn: () {
                        _navigateToSignIn();
                      }),
                      Expanded(child: Container(color: Colors.teal)),
                    ],
                  )
                ]);
              },
            )
          ],
        ),
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key, required this.onRegister, required this.onSignIn});

  final Function onRegister, onSignIn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                onRegister();
              },
              child: const Text('Register')),
          TextButton(
              onPressed: () {
                onSignIn();
              },
              child: const Text('Sign In'))
        ],
      ),
    );
  }
}
