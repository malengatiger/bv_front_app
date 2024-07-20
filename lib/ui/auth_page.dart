import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bidvest Auth'),
      ),
      body: SafeArea(child: Stack(
        children: [
          ScreenTypeLayout.builder(
            mobile: (ctx){return Container(color:Colors.red);},
            tablet: (ctx){return Container(color:Colors.yellow);},
            desktop: (ctx){return Container(color:Colors.teal);},
          )
        ],
      ))
    );
  }
}
