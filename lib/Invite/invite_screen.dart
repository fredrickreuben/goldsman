import 'package:clipboard/clipboard.dart';
import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Home/home_screen.dart';
import 'package:goldsman/Widgets/buttons.dart';
import 'package:goldsman/main.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:goldsman/Constance/constance.dart' as constance;

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
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
                      "Invite Friends",
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
                  "Invite your friends to join Baqti community and earn 20 Shukran Points",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: HexColor(constance.disableTextColorString),
                        fontSize: 16,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Theme.of(context).backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.07),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 6, top: 8, bottom: 8),
                        child: Row(
                          children: [
                            Text(
                              "PRO80128",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: HexColor(constance.disableTextColorString),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            InkWell(
                              onTap: () {
                                FlutterClipboard.copy('PRO80128');
                                constance.openSnackBar(context, "Text Copied", SnackBarTye.succsess, isVibrate: true);
                              },
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: HexColor("#727c8e"),
                                child: const Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: ListView(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 30),
                children: [
                  socialInvitation("Twitter", "Invite friends from twitter", ConstanceData.twitter),
                  socialInvitation("Twitter", "Invite friends from facebook", ConstanceData.facebook),
                  socialInvitation("Twitter", "Invite friends from contacts", ConstanceData.contacts),
                  socialInvitation("Twitter", "Invite friends from email", ConstanceData.email),
                  ButtonWidget(
                    text: "Continue",
                    ontap: () {
                      Navigator.pushReplacementNamed(context, Routes.HOME,
                          arguments: PageTransition(child: const HomeScreen(), type: PageTransitionType.leftToRightWithFade));
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "I will invite later",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: HexColor(constance.disableTextColorString),
                          fontSize: 20,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.HOME,
                          arguments: PageTransition(child: const HomeScreen(), type: PageTransitionType.leftToRightWithFade));
                    },
                    child: Text(
                      "Skip",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget socialInvitation(String socialName, String detail, String image) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(image, height: 43),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  socialName,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  detail,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: HexColor(constance.disableTextColorString),
                        fontSize: 16,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(),
        const SizedBox(height: 12),
      ],
    );
  }
}
