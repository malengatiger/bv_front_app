import 'package:bv_front_app/ui/landing.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BidvestLandingPage extends StatefulWidget {
  const BidvestLandingPage({super.key});

  @override
  State<BidvestLandingPage> createState() => _BidvestLandingPageState();
}

class _BidvestLandingPageState extends State<BidvestLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bidvest Landing Page'),
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
