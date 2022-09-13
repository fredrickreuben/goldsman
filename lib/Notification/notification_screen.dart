// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Order/track_order.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                  InkWell(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      Navigator.pop(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRightWithFade,
                          duration: const Duration(milliseconds: 100),
                          child: const SizedBox(),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Notifications",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 24,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset(ConstanceData.Notification, height: 35),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*Expanded(
            child: !isLoading
                ? ListView(
                    padding: EdgeInsets.only(right: 14, left: 8, top: 14, bottom: MediaQuery.of(context).padding.bottom + 24),
                    children: [
                      Row(
                        children: [
                          Image.asset(ConstanceData.noti1, width: 70),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Legfashion Sale starting tomorrow. Don’t forget to check it out for ',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'great deals!',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Just Now",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                      dividers(),
                      Row(
                        children: [
                          Image.asset(ConstanceData.noti2, width: 70),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Legfashion’s Store marked your order ',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                  TextSpan(
                                    text: '#1196205 ',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#8B9DFF"),
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'as shipped',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Yesterday",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 14,
                                  color: HexColor("#4C5469"),
                                ),
                          ),
                        ],
                      ),
                      dividers(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 300),
                              child: const TrackOrder(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Hero(
                              tag: "ConstanceData.noti3",
                              child: Image.asset(
                                ConstanceData.noti3,
                                width: 70,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Package from your order ',
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontSize: 14,
                                          ),
                                    ),
                                    TextSpan(
                                      text: '#1196205 ',
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: HexColor("#65dacc"),
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'has arrived to destination country',
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              "11 May",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 14,
                                    color: HexColor("#4C5469"),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      dividers(),
                      Row(
                        children: [
                          Image.asset(ConstanceData.noti4, width: 70),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '50% OFF of Everything at Legfashion Store!!',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "11 May",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 14,
                                  color: HexColor("#4C5469"),
                                ),
                          ),
                        ],
                      ),
                      dividers(),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(ConstanceData.noti5, width: 55),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'We’ve recently added ',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'Apply Pay ',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'payment options',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "5 Feb",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 14,
                                  color: HexColor("#4C5469"),
                                ),
                          ),
                        ],
                      ),
                    ],
                  )
                : ListView(
                    padding: EdgeInsets.only(right: 14, left: 14, top: 14, bottom: MediaQuery.of(context).padding.bottom + 24),
                    children: [
                      ShimmerWidget(
                        isLoading: isLoading,
                        widget: Column(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.grey[200],
                                        ),
                                        width: 70,
                                        height: 70,
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
                                            width: 150,
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
                                            width: 150,
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Container(
                                        padding: const EdgeInsets.only(left: 24, right: 24),
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
                                          color: Colors.grey[200],
                                        ),
                                        height: 12,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
          )*/
        ],
      ),
    );
  }

  Widget dividers() {
    return const Divider(
      thickness: 0.60,
      endIndent: 10,
      indent: 60,
    );
  }
}
