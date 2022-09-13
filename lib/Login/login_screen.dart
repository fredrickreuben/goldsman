// ignore_for_file: unnecessary_new, unnecessary_null_comparison

import 'package:goldsman/Constance/constance.dart' as constance;
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Login/forgotpass_screen.dart';
import 'package:goldsman/SignUp/signup_screen.dart';
import 'package:goldsman/Widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Home/home_screen.dart';
import '../Home/main_home.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height / 2 +
                50,
            left: 14,
            right: 14),
        children: [
          Text(
            "Sign In",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Sign in to your account bellow!",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: HexColor(constance.disableTextColorString),
                  fontSize: 16,
                ),
            textAlign: TextAlign.center,
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
            height: 10,
          ),
          Text(
            "OR",
            style: TextStyle(
                color: HexColor(constance.disableTextColorString),
                fontSize: 18,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          textItem("Email", TextInputType.emailAddress, _emailController, false),
          const SizedBox(
            height: 16,
          ),
          textItem("Password", TextInputType.visiblePassword, _passwordController, true),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 500),
                      child: const ForgotPassword(),
                    ),
                  );
                },
                child: Text("Forgot your password?",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                    textAlign: TextAlign.end),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          ButtonWidget(
            text: "Sign In",
            ontap: () async {
              Navigator.pushReplacementNamed(context, Routes.HOME,
                  arguments: PageTransition(child: const MainHomeScreen(), type: PageTransitionType.leftToRightWithFade));
            },
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "I don't have an account? ",
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
                        child: const SignUpScreen(),
                      ),
                    );
                  });
                },
                child: Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
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
        keyboardType: keyboardType,
        obscureText: obsecureText,
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

  Widget colorButton(String name) {
    return InkWell(
      onTap: () async {
        try {} catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular = false;
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 90,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(colors: [
            Color(0xFFFD746C),
            Color(0xFFFF9068),
            Color(0xFFFD746C),
          ]),
        ),
        child: Center(
          child: circular
              ? const CircularProgressIndicator()
              : Text(name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
        ),
      ),
    );
  }
}
