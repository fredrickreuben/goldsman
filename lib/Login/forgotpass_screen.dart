// ignore_for_file: unnecessary_new, unnecessary_null_comparison

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Login/login_screen.dart';
import 'package:goldsman/Widgets/buttons.dart';
import 'package:goldsman/Widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:goldsman/Constance/constance.dart' as constance;
import 'package:page_transition/page_transition.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + AppBar().preferredSize.height / 2, left: 14, right: 14),
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
                      child: const LoginScreen(),
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
            "Forgot Password",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Please, enter your email address. You will receive a link to create a new password via email",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: HexColor(constance.disableTextColorString),
                  fontSize: 16,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFields(
            hinttext: "abc@gmail.com",
            labletext: "Email",
            isAutofocus: true,
            isPrefix: false,
            textinputType: TextInputType.emailAddress,
            ctrl: emailCtrl,
          ),
          const SizedBox(
            height: 24,
          ),
          ButtonWidget(
            text: "Send Now",
            ontap: () {
              //   FancySnackbar.showSnackbar(
              //     context,
              //     snackBarType: FancySnackBarType.error,
              //     title: "Success Title",
              //     message: "Success Message",
              //     duration: 2,
              //     onCloseEvent: () {},
              //   );
              if (emailCtrl.text == null || emailCtrl.text == "") {
                constance.openSnackBar(context, "Please Enter Email", SnackBarTye.error, isVibrate: true);
              } else if (emailCtrl.text != null && emailCtrl.text.length < 6) {
                constance.openSnackBar(context, "Please Enter valid Email", SnackBarTye.error, isVibrate: true);
              } else {
                constance.openSnackBar(context, "We Sent email check please", SnackBarTye.succsess, isVibrate: false);
              }
            },
          )
        ],
      ),
    );
  }
}
