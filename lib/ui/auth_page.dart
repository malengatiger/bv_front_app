import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key, required this.bidvestUser});

  final bool bidvestUser;

  @override
  State<AuthPage> createState() => _AuthPageState();
}


class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bidvest User Authentication'),
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
