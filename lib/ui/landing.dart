import 'package:bv_front_app/util/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../services/auth_service.dart';
import '../util.dart';
import '../util/prefs.dart';
import '../util/toasts.dart';
import 'auth/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const mm = '🌍🌍🌍LandingPage: ';

  AuthService authService = GetIt.instance<AuthService>();
  Prefs prefs = GetIt.instance<Prefs>();
  late UserBag  userBag;

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  void _checkStatus() async {
    await authService.signInTemporary();
    userBag = prefs.getUser();
    if (userBag.bidvestUser != null) {
      _navigateToBidvestLandingPage();
      return;
    }
    if (userBag.organizationUser != null) {
      _navigateToOrganizationLandingPage();
      return;
    }

    pp('$mm .... User needs to pony up! ...');
  }


  _navigateToRegister() {
    showToast(
        textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        padding: 20,
        backgroundColor:  Colors.blue.shade800,
        toastGravity:  ToastGravity.TOP,
        message: 'Registration is not available yet', context: context);
  }
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey();

  _navigateToSignInPage() async {
    pp('$mm  ... _navigateToSignIn ...');
    NavigationUtils.navigateToPage(context: context, widget: const SignInPage());
  }



  _navigateToBidvestLandingPage() {}

  _navigateToOrganizationLandingPage() {}

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
                      SignUpActions(onRegister: () {
                        _navigateToRegister();
                      }, onSignIn: () {
                        _navigateToSignInPage();
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
                      SignUpActions(onRegister: () {
                        _navigateToRegister();
                      }, onSignIn: () {
                        _navigateToSignInPage();
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
                      SignUpActions(onRegister: () {
                        _navigateToRegister();
                      }, onSignIn: () {
                        _navigateToSignInPage();
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

class SignUpActions extends StatelessWidget {
  const SignUpActions({super.key, required this.onRegister, required this.onSignIn});

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
