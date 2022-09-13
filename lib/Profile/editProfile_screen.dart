// ignore_for_file: unnecessary_new, file_names

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Notification/notification_screen.dart';
import 'package:goldsman/Widgets/backArrow.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                  const BackArrow(),
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
                          child: Image.asset(ConstanceData.Notification, height: 35),
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
            child: Text(
              "Profile information",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 20,
                    color: HexColor("#515C6F"),
                  ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(right: 14, left: 14, top: 14, bottom: MediaQuery.of(context).padding.bottom + 24),
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
                      details(ConstanceData.name, "Full Name", "Majed Mohammed", HexColor("#515c6f")),
                      details(ConstanceData.pass, "Password", "************", HexColor("#515c6f"), isEmogy: true, emogy: ConstanceData.smily),
                      details(ConstanceData.emailAddress, "Email Address", "majeddukhi@gmail.com", HexColor("#515c6f"),
                          isEmogy: true, emogy: ConstanceData.lock),
                      details(ConstanceData.phone, "Phone Number", "+96650-859-5692", HexColor("#f39d10"),
                          isEmogy: true, emogy: ConstanceData.Vector),
                      details(ConstanceData.shipping, "Shipping Address", "Khazumam 35421, St. King Khaled", HexColor("#515c6f")),
                      details(ConstanceData.payment, "Payment Method", "Visa **53", HexColor("#515c6f")),
                      details(ConstanceData.bell, "Notification Settings", "one notification", HexColor("#515c6f"), isShowDivider: false),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget details(String image, String title, String subTitle, Color color, {bool isShowDivider = true, bool isEmogy = false, String emogy = ""}) {
    return !isLoading
        ? Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset(
                    image,
                    width: 18,
                    color: AppTheme.isLightTheme ? HexColor("#515c6f") : Colors.white,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 16,
                              color: AppTheme.isLightTheme ? HexColor("#515C6F") : Colors.white,
                            ),
                      ),
                      Text(
                        subTitle,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 14,
                              color: color,
                            ),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  isEmogy
                      ? Row(
                          children: [
                            Image.asset(
                              emogy,
                              height: 18,
                            ),
                            const SizedBox(
                              width: 16,
                            )
                          ],
                        )
                      : const SizedBox(),
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
                      thickness: 0.60,
                      endIndent: 10,
                      indent: 40,
                    )
                  : const SizedBox()
            ],
          )
        : ShimmerWidget(
            isLoading: isLoading,
            widget: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                      ),
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 16,
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
                          height: 18,
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
                          height: 18,
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                      ),
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
                isShowDivider
                    ? const SizedBox(
                        height: 24,
                      )
                    : const SizedBox()
              ],
            ),
          );
  }
}
