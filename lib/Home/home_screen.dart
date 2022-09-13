import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500),
                child: const MainHomeScreen(),
              ),
            );
          },
          child: Column(
            children: [
              Image.asset(
                ConstanceData.wellcome1,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            ConstanceData.wellcome2,
                          ),
                          Image.asset(
                            ConstanceData.wellcome4,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        ConstanceData.wellcome3,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
