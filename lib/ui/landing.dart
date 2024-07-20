import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../util.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const mm = '🌍🌍🌍LandingPage: ';

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  void _checkStatus() async {
    var auth = FirebaseAuth.instance;
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
      appBar: AppBar(
        title: const Text('Bidvest Supplier Programme')
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ScreenTypeLayout.builder(
              mobile: (ctx) {
                return Container(color: Colors.red);
              },
              tablet: (ctx) {
                return Container(color: Colors.yellow);
              },
              desktop: (ctx) {
                return Container(color: Colors.blue);
              },
            )
          ],
        ),
      ),
    );
  }
}
