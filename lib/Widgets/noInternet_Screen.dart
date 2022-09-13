// ignore_for_file: unnecessary_new, file_names

import 'package:connectivity/connectivity.dart';
import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Constance/constance.dart' as constance;
import 'package:goldsman/Home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Image.asset(ConstanceData.stars, height: 60),
              ),
              Image.asset(ConstanceData.nointernet, height: 100),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Connection Failed",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Could not connect to the network! Please check and try again",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 18,
                      color: HexColor("#727C8E"),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: new Material(
                      color: Colors.transparent,
                      child: new InkWell(
                        onTap: () async {
                          var connectivityResult =
                              await (Connectivity().checkConnectivity());
                          if (connectivityResult == ConnectivityResult.none) {
                            constance.openSnackBar(context,
                                "No Internet Connect !!!", SnackBarTye.error,
                                isVibrate: true);
                          } else {
                            constance.openSnackBar(context, "Internet Connect",
                                SnackBarTye.succsess,
                                isVibrate: true);
                            await Future.delayed(const Duration(seconds: 1));

                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                duration: const Duration(milliseconds: 500),
                                child: const MainHomeScreen(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 18, right: 8),
                          child: Row(
                            children: [
                              const SizedBox(),
                              Text(
                                "GO BACK",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Theme.of(context).primaryColor,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
