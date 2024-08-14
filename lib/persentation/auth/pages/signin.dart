import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/common/widgets/appbar/app_bar.dart';
import 'package:spotify_app/common/widgets/button/besic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/data/models/auth/create_signin_request.dart';
import 'package:spotify_app/domain/usecase/auth/sign_in_usecase.dart';
import 'package:spotify_app/persentation/auth/pages/signup.dart';
import 'package:spotify_app/persentation/home/pages/home.dart';
import 'package:spotify_app/service_locator.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final emailContoller = TextEditingController();
  final passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _signUpText(context),
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
            _signinText(),
            const SizedBox(
              height: 50,
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
              title: "Sign In",
              onPressed: () async {
                var result = serviceLocator<SignInUsecase>().call(
                  params: SignInRequest(
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

  Widget _signinText() {
    return const Text(
      "Sign In",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: emailContoller,
      decoration: const InputDecoration(hintText: "Enter Username Or Email")
          .applyDefaults(
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

  Widget _signUpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not A Member? ",
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
                  builder: (BuildContext contex) => SignUpPage(),
                ),
              );
            },
            child: const Text("Register Now"),
          )
        ],
      ),
    );
  }
}
