// ignore_for_file: unnecessary_new, prefer_const_constructors, avoid_unnecessary_containers

import 'dart:async';

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Home/home_screen.dart';
import 'package:goldsman/Widgets/buttons.dart';
import 'package:goldsman/main.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:page_transition/page_transition.dart';
import 'package:goldsman/Constance/constance.dart' as constance;

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OtpFieldController otpctrl = new OtpFieldController();

  Timer? timer;
  var time = 60;
  var timeTxt = '60';

  @override
  void initState() {
    super.initState();
    setOtp();
  }

  setSecondView() {
    timer?.cancel();
    timer = new Timer(new Duration(seconds: 1), () {
      if (time - 1 != -1) {
        time -= 1;
        timeTxt = '$time';
        if (timeTxt.length == 1) {
          timeTxt = '0$timeTxt';
        }
        setState(() {});
        setSecondView();
        if (time == 0) {
          timer?.cancel();
        }
      }
    });
  }

  setOtp() async {
    setSecondView();
    await Future.delayed(const Duration(milliseconds: 2000));
    otpctrl.setValue("1", 0);
    otpctrl.setValue("2", 1);
    otpctrl.setValue("3", 2);
    otpctrl.setValue("4", 3);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + AppBar().preferredSize.height / 2, left: 14, right: 14),
            child: Column(
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
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Verification Code",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "We sent you a code to verify your phone number",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: HexColor(constance.disableTextColorString),
                        fontSize: 16,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                OTPTextField(
                  length: 4,
                  fieldWidth: 50,
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  fieldStyle: FieldStyle.box,
                  controller: otpctrl,
                  otpFieldStyle: OtpFieldStyle(
                    focusBorderColor: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    '00 : $timeTxt',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, right: 14),
                  child: ButtonWidget(
                    text: "Confirm",
                    ontap: () async {
                      constance.openSnackBar(context, "Succsessfull Login", SnackBarTye.succsess, isVibrate: true);
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushReplacementNamed(context, Routes.HOME,
                          arguments: PageTransition(child: HomeScreen(), type: PageTransitionType.leftToRightWithFade));
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I didn’t receive a code!",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: HexColor(constance.disableTextColorString),
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Resend",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: HexColor("#C7CCD3"),
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
