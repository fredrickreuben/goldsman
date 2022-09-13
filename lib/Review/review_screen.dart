// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarUI(
            isBackArrow: true,
            text: "Review",
            ontap: () {
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
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 14, right: 14, top: 14, bottom: MediaQuery.of(context).padding.bottom + 20),
              children: [
                reviews(ConstanceData.review1, "Yoonus al-Abad", "I loved this dress", ConstanceData.review1A, "7 Jun,2020"),
                SizedBox(height: 12),
                dividers(),
                SizedBox(height: 12),
                reviews(ConstanceData.review2, "Wajedan Muhana", "It fit perfectly! I'm 5'7'", ConstanceData.review2A, "14 May,2020"),
                SizedBox(height: 12),
                dividers(),
                SizedBox(height: 12),
                reviews(ConstanceData.review3, "Zaki Moussa", "It’s quick, efficient, comfortable!", ConstanceData.review3A, "26 Dec,2019"),
                SizedBox(height: 12),
                dividers(),
                SizedBox(height: 12),
                reviews(ConstanceData.review4, "Rifaah Madani", "This dress would be fit for me!", ConstanceData.review4A, "11 Nov,2019"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget dividers() {
    return Divider(thickness: 0.8, indent: 12, endIndent: 12);
  }

  Widget reviews(String userImage, String name, String detail, String productImage, String date) {
    return Row(
      children: [
        Image.asset(userImage, height: 70),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  for (var i = 0; i < 4; i++)
                    Icon(
                      Icons.star,
                      color: HexColor("#ffba49"),
                      size: 18,
                    ),
                  Icon(
                    Icons.star_border,
                    size: 18,
                    color: HexColor("#9b9b9b"),
                  ),
                ],
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                detail,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),
              ),
              SizedBox(height: 8),
              Image.asset(
                productImage,
              ),
            ],
          ),
        ),
        Expanded(child: SizedBox()),
        Text(
          date,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 12,
              ),
        ),
      ],
    );
  }
}
