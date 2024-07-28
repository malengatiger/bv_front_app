import 'package:bv_front_app/ui/auth/sign_in_form.dart';
import 'package:bv_front_app/util.dart';
import 'package:bv_front_app/util/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../data/user.dart';
import '../../services/auth_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  AuthService authService = GetIt.instance<AuthService>();
  bool busy = false;
  static const mm = '💦💦💦💦SignInPage 💦';
  @override
  void initState() {
    super.initState();
  }

  _onSubmit() async {
    setState(() {
      busy = true;
    });
    pp('$mm ... onSubmit .... submitting email/password');
    try {
      var res = await authService.signIn(
          email: emailController.text, password: passwordController.text);
      pp('$mm sign in result: $res');
      if (res is OrganizationUser) {
      _navigateToOrganizationDashboard();
      }
      if (res is BidvestUser) {
        _navigateToBidvestDashboard();
      }
    } catch (e) {
      pp(e);
      if (mounted) {
        showErrorDialog(context, '$e');
      }
    }

    setState(() {
      busy = false;
    });
  }
  _navigateToOrganizationDashboard() {
    pp('$mm _navigateToOrganizationDashboard ...');
  }
  _navigateToBidvestDashboard() {
    pp('$mm _navigateToBidvestDashboard ...');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bidvest User Authentication'),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            ScreenTypeLayout.builder(
              mobile: (ctx) {
                return SignInForm(
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    onSubmit: () {
                      _onSubmit();
                    });
              },
              tablet: (ctx) {
                return Row(
                  children: [
                    SizedBox(
                        width: (width / 2) - 12,
                        child: Container(color: Colors.teal)),
                    SizedBox(
                      width: (width / 2) - 12,
                      child: SignInForm(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                          onSubmit: () {
                            _onSubmit();
                          }),
                    )
                  ],
                );
              },
              desktop: (ctx) {
                return Row(
                  children: [
                    SizedBox(
                        width: (width / 2) - 16,
                        child: Container(color: Colors.teal)),
                    SizedBox(
                      width: (width / 2) - 16,
                      child: SignInForm(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                          onSubmit: () {
                            _onSubmit();
                          }),
                    )
                  ],
                );
              },
            )
          ],
        )));
  }
}
