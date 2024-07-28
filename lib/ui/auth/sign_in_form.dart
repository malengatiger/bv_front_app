import 'package:bv_front_app/util/styles.dart';
import 'package:flutter/material.dart';

import '../../util/gaps.dart';

class SignInForm extends StatelessWidget {
  const SignInForm(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.onSubmit});

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController, passwordController;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Center(
      child: SizedBox(
        height: height / 3,
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  gapH32,
                  gapH32,
                  Text('User Credentials', style: myTextStyleLarge(context)),
                  gapH32,
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter email address',
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email address';
                      }
                      return null;
                    },
                  ),
                  gapH16,
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter password',
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  gapH32,
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          onSubmit();
                        }
                      },
                      child: const Text('Submit'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
