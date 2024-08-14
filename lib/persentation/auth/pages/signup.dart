import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/common/widgets/appbar/app_bar.dart';
import 'package:spotify_app/common/widgets/button/besic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/data/models/auth/create_user_request.dart';
import 'package:spotify_app/domain/usecase/auth/sign_up_usecase.dart';
import 'package:spotify_app/persentation/auth/pages/signin.dart';
import 'package:spotify_app/persentation/home/pages/home.dart';
import 'package:spotify_app/service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController fullNameContoller = TextEditingController();
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _siginText(context),
        appBar: BesicAppBar(
          title: SvgPicture.asset(
            AppVectors.logo,
            height: 40,
            width: 40,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 50,
          ),
          child: Column(children: [
            _registerText(),
            const SizedBox(
              height: 50,
            ),
            _fullNameField(context),
            const SizedBox(
              height: 20,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            BesicAppButton(
              title: "Create Account",
              onPressed: () async {
                var result = serviceLocator<SignUpUsecase>().call(
                  params: CreateUserRequest(
                    fullName: fullNameContoller.text.toString(),
                    email: emailContoller.text.toString(),
                    password: passwordContoller.text.toString(),
                  ),
                );
                result.fold(
                  (leaf) {
                    var snackBar = SnackBar(
                      content: Text(leaf),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  (right) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
            ),
          ]),
        ));
  }

  Widget _registerText() {
    return const Text(
      "Register",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: fullNameContoller,
      decoration: const InputDecoration(hintText: "Full Name").applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: emailContoller,
      decoration: const InputDecoration(hintText: "Enter Email").applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: passwordContoller,
      decoration: const InputDecoration(hintText: "Password").applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Do you have an account? ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext contex) => SignInPage(),
                ),
              );
            },
            child: const Text("Sign In"),
          )
        ],
      ),
    );
  }
}
