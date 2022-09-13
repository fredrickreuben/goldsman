// ignore_for_file: unnecessary_new, unnecessary_null_comparison

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Constance/constance.dart' as constance;
import 'package:goldsman/Invite/invite_screen.dart';
import 'package:goldsman/Login/login_screen.dart';
import 'package:goldsman/Widgets/buttons.dart';
import 'package:goldsman/Widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 14, right: 14),
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(
                    context,
                    PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      duration: const Duration(milliseconds: 500),
                      child: const SizedBox(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16 + 20,
          ),
          Text(
            "Let’s Get Started",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Signing up or login to see our top and latest fashion style",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: HexColor(constance.disableTextColorString),
                  fontSize: 16,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          buttonItem(FontAwesomeIcons.google, "Continue with Google", 25,
              const Color(0xFFDB4437), () {}),
          const SizedBox(
            height: 10,
          ),
          buttonItem(FontAwesomeIcons.facebookF, "Continue with Facebook", 30,
              const Color(0xFF4267B2), () {}),
          const SizedBox(
            height: 12,
          ),
          textItem("Email", TextInputType.emailAddress, _emailController, false),
          const SizedBox(
            height: 12,
          ),
          textItem("Password", TextInputType.visiblePassword, _passwordController, false),
          const SizedBox(
            height: 12,
          ),
          textItem("Confirm Password", TextInputType.visiblePassword, _passwordConfirmController, false),
          const SizedBox(
            height: 16,
          ),
          Text(
            "By creating an account, you agree to our Terms of Service and Privacy Policy",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: HexColor(constance.disableTextColorString),
                  fontSize: 16,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          ButtonWidget(
            text: "Sign Up",
            ontap: () async {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 500),
                    child: const InviteScreen(),
                  ),
                );
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? Log In ",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: HexColor(constance.disableTextColorString),
                      fontSize: 16,
                    ),
              ),
              InkWell(
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 500),
                        child: const LoginScreen(),
                      ),
                    );
                  });
                },
                child: Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + 30,
          ),
        ],
      ),
    );
  }

  Widget buttonItem(IconData icon, String buttonName, double size,
      Color background, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: 60,
        child: Card(
          elevation: 8,
          color: background,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                width: 1,
                color: Colors.black12,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon, size: size, color: const Color(0xFFFFFFFF)),
              const SizedBox(
                width: 15,
              ),
              Text(
                buttonName,
                style: const TextStyle(
                  color: Color(0xD9FFFFFF),
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(
      String name, TextInputType keyboardType, TextEditingController controller, bool obsecureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obsecureText,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: 17,
          color: HexColor(constance.disableTextColorString),
        ),
        decoration: InputDecoration(
          labelText: name,
          labelStyle: TextStyle(
            fontSize: 17,
            color: HexColor(constance.disableTextColorString),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2.0,
              color: HexColor(constance.primaryColorString),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2.0,
              color: HexColor(constance.disableTextColorString),
            ),
          ),
        ),
      ),
    );
  }
}
