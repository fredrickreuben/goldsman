// ignore_for_file: unnecessary_new, prefer_const_constructors, deprecated_member_use

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Notification/notification_screen.dart';
import 'package:goldsman/Order/myOrder_screen.dart';
import 'package:goldsman/Profile/editProfile_screen.dart';
import 'package:goldsman/Review/review_screen.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:goldsman/main.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:goldsman/Constance/constance.dart' as constance;

class ProfileScreen extends StatefulWidget {
  final AnimationController? animationController;

  const ProfileScreen({Key? key, this.animationController}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              boxShadow: [
                AppTheme.isLightTheme
                    ? BoxShadow(
                        color: Colors.grey.withOpacity(0.07),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    : const BoxShadow(
                        color: Colors.transparent,
                      ),
              ],
            ),
            height: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + 14,
            child: Padding(
              padding: const EdgeInsets.only(top: 14, right: 14, left: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const SizedBox(),
                  Text(
                    "My Profile",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          child: Image.asset(ConstanceData.Notification, height: 35),
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                duration: const Duration(milliseconds: 500),
                                child: const NotificationScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14, left: 14, top: 14),
            child: !isLoading
                ? Row(
                    children: [
                      Image.asset(
                        ConstanceData.grey,
                        height: 80,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeftWithFade,
                                      duration: const Duration(milliseconds: 500),
                                      child: const EditProfile(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      AppTheme.isLightTheme
                                          ? BoxShadow(
                                              color: Colors.grey.withOpacity(0.07),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3),
                                            )
                                          : const BoxShadow(
                                              color: Colors.transparent,
                                            )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 14, right: 14),
                                    child: Text(
                                      "EDIT PROFILE",
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, Routes.LOGIN);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: HexColor("#f0867f"),
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: HexColor("#f0867f").withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 14, right: 14),
                                    child: Text(
                                      "LOG OUT",
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                : ShimmerWidget(
                    isLoading: isLoading,
                    widget: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 80),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[200],
                          ),
                          height: 80,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 51, right: 51),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.grey[200],
                              ),
                              height: 14,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 51, right: 51),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.grey[200],
                              ),
                              height: 14,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.grey[200],
                                  ),
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.grey[200],
                                  ),
                                  height: 24,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(right: 14, left: 14, top: 24, bottom: MediaQuery.of(context).padding.bottom + 24),
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      AppTheme.isLightTheme
                          ? BoxShadow(
                              color: Colors.grey.withOpacity(0.07),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            )
                          : const BoxShadow(
                              color: Colors.transparent,
                            ),
                    ],
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 500),
                              child: const MyOrderScreen(),
                            ),
                          );
                        },
                        child: details(ConstanceData.allorder, "All My Orders"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 500),
                              child: const MyOrderScreen(
                                orderType: "In Transit",
                              ),
                            ),
                          );
                        },
                        child: details(ConstanceData.pendingshipments, "Pending Shipments"),
                      ),
                      InkWell(
                        onTap: () {
                          showGeneralDialog(
                            transitionBuilder: (context, a1, a2, widget) {
                              return Transform.scale(
                                scale: a1.value,
                                child: Opacity(
                                  opacity: a1.value,
                                  child: AlertDialog(
                                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                                    title: Center(
                                      child: Text(
                                        'Select Theme Mode',
                                        style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Divider(height: 24),
                                        InkWell(
                                          onTap: () async {
                                            MyApp.setCustomeTheme(context, 6);
                                            await themeset();
                                          },
                                          child: selectOption('Light', true),
                                        ),
                                        const Divider(height: 24),
                                        InkWell(
                                          onTap: () async {
                                            MyApp.setCustomeTheme(context, 7);
                                            await themeset();
                                          },
                                          child: selectOption('Dark', false),
                                        ),
                                        const Divider(height: 24),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            InkWell(
                                              highlightColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () async {
                                                selectfirstColor(context);
                                                await themeset();
                                              },
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor: Color(0xFF65dacc),
                                                child: !selectFirstColor
                                                    ? CircleAvatar(
                                                        radius: 6,
                                                        backgroundColor: Theme.of(context).appBarTheme.color,
                                                      )
                                                    : SizedBox(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            InkWell(
                                              highlightColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () async {
                                                selectsecondColor(context);
                                                await themeset();
                                              },
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor: Color(0xFF32a852),
                                                child: selectSecondColor
                                                    ? CircleAvatar(
                                                        radius: 6,
                                                        backgroundColor: Theme.of(context).appBarTheme.color,
                                                      )
                                                    : SizedBox(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            InkWell(
                                              highlightColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () async {
                                                selectthirdColor(context);
                                                await themeset();
                                              },
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor: Color(0xFFe6230e),
                                                child: selectThirdColor
                                                    ? CircleAvatar(
                                                        radius: 6,
                                                        backgroundColor: Theme.of(context).appBarTheme.color,
                                                      )
                                                    : SizedBox(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            InkWell(
                                              highlightColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () async {
                                                selectfourthColor(context);
                                                await themeset();
                                              },
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor: Color(0xFF760ee6),
                                                child: selectFourthColor
                                                    ? CircleAvatar(
                                                        radius: 6,
                                                        backgroundColor: Theme.of(context).appBarTheme.color,
                                                      )
                                                    : SizedBox(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            InkWell(
                                              highlightColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () async {
                                                selectfifthColor(context);
                                                await themeset();
                                              },
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor: Color(0xFF008080),
                                                child: selectFifthColor
                                                    ? CircleAvatar(
                                                        radius: 6,
                                                        backgroundColor: Theme.of(context).appBarTheme.color,
                                                      )
                                                    : SizedBox(),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            InkWell(
                                              highlightColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () async {
                                                selectsixthColor(context);
                                                await themeset();
                                              },
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor: Color(0xFF4FBE9F),
                                                child: selectSixthColor
                                                    ? CircleAvatar(
                                                        radius: 6,
                                                        backgroundColor: Theme.of(context).appBarTheme.color,
                                                      )
                                                    : SizedBox(),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 200),
                            barrierDismissible: true,
                            barrierLabel: '',
                            context: context,
                            pageBuilder: (context, animation1, animation2) {
                              return const Text("data");
                            },
                          );
                        },
                        child: details(ConstanceData.language, "Theme"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 500),
                              child: const MyOrderScreen(
                                orderType: "Delivered",
                              ),
                            ),
                          );
                        },
                        child: details(ConstanceData.finish, "Finished Orders", isShowDivider: false),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      AppTheme.isLightTheme
                          ? BoxShadow(
                              color: Colors.grey.withOpacity(0.07),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            )
                          : const BoxShadow(
                              color: Colors.transparent,
                            ),
                    ],
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          await Share.share('check Our PortFolio https://codecanyon.net/user/fluttervision/portfolio');
                        },
                        child: details(ConstanceData.invite, "Invite Friends"),
                      ),
                      InkWell(
                        onTap: () async {
                          final Uri launchUri = Uri(scheme: 'mailto', path: "stonelabindia@gmail.com");
                          await launch(launchUri.toString());
                        },
                        child: details(ConstanceData.support, "Customer Support"),
                      ),
                      InkWell(
                        onTap: () async {
                          await launch("https://themeforest.net/downloads");
                        },
                        child: details(ConstanceData.rate, "Rate Our App"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 500),
                              child: const ReviewScreen(),
                            ),
                          );
                        },
                        child: details(ConstanceData.suggest, "Review", isShowDivider: false),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  themeset() async {
    constance.openSnackBar(context, "New Theme Set", SnackBarTye.succsess, isVibrate: true);
    await Future.delayed(Duration(milliseconds: 300));
    Navigator.pop(context);
  }

  bool selectFirstColor = false;
  bool selectSecondColor = false;
  bool selectThirdColor = false;
  bool selectFourthColor = false;
  bool selectFifthColor = false;
  bool selectSixthColor = false;

  selectfirstColor(BuildContext context) {
    if (selectFirstColor) {
      selectFirstColor = false;
      selectSecondColor = false;
      selectThirdColor = false;
      selectFourthColor = false;
      selectFifthColor = false;
      selectSixthColor = false;

      MyApp.setCustomeTheme(context, 0);
    }
  }

  selectsecondColor(BuildContext context) {
    if (!selectSecondColor) {
      selectFirstColor = true;
      selectSecondColor = true;
      selectThirdColor = false;
      selectFourthColor = false;
      selectFifthColor = false;
      selectSixthColor = false;

      MyApp.setCustomeTheme(context, 1);
    }
  }

  selectthirdColor(BuildContext context) {
    if (!selectThirdColor) {
      selectFirstColor = true;
      selectSecondColor = false;
      selectThirdColor = true;
      selectFourthColor = false;
      selectFifthColor = false;
      selectSixthColor = false;
    }
    MyApp.setCustomeTheme(context, 2);
  }

  selectfourthColor(BuildContext context) {
    if (!selectFourthColor) {
      selectFirstColor = true;
      selectSecondColor = false;
      selectThirdColor = false;
      selectFourthColor = true;
      selectFifthColor = false;
      selectSixthColor = false;
    }
    MyApp.setCustomeTheme(context, 3);
  }

  selectfifthColor(BuildContext context) {
    if (!selectFifthColor) {
      selectFirstColor = true;
      selectSecondColor = false;
      selectThirdColor = false;
      selectFourthColor = false;
      selectFifthColor = true;
      selectSixthColor = false;
    }
    MyApp.setCustomeTheme(context, 4);
  }

  selectsixthColor(BuildContext context) {
    if (!selectSixthColor) {
      selectFirstColor = true;
      selectSecondColor = false;
      selectThirdColor = false;
      selectFourthColor = false;
      selectFifthColor = false;
      selectSixthColor = true;
    }
    MyApp.setCustomeTheme(context, 5);
  }

  Widget selectOption(String optionText, bool isSun) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSun ? Image.asset(ConstanceData.sun, height: 35) : Image.asset(ConstanceData.moon, height: 30),
        const SizedBox(width: 4),
        Text(
          optionText,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 18,
              ),
        ),
      ],
    );
  }

  Widget details(String image, String title, {bool isShowDivider = true}) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Image.asset(
              image,
              width: 18,
              color: AppTheme.isLightTheme ? HexColor("#515C6F") : Colors.white,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                    color: AppTheme.isLightTheme ? HexColor("#515C6F") : Colors.white,
                  ),
            ),
            const Expanded(child: SizedBox()),
            Image.asset(
              ConstanceData.arrow,
              height: 18,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        isShowDivider
            ? const Divider(
                thickness: 1,
              )
            : const SizedBox()
      ],
    );
  }
}
