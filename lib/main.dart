// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, constant_identifier_names

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Home/home_screen.dart';
import 'package:goldsman/Login/login_screen.dart';
import 'package:goldsman/Splash/spash_screen.dart';
import 'package:goldsman/Widgets/noInternet_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:goldsman/Constance/constance.dart' as constance;
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'Home/main_home.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([
    // DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]).then(
        (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  static setCustomeTheme(BuildContext context, int index) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCustomeTheme(index);
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setCustomeTheme(int index) {
    if (index == 6) {
      setState(() {
        AppTheme.isLightTheme = true;
      });
    } else if (index == 7) {
      setState(() {
        AppTheme.isLightTheme = false;
      });
    } else {
      setState(() {
        constance.colorsIndex = index;
        constance.primaryColorString = ConstanceData().colors[constance.colorsIndex];
        constance.secondaryColorString = constance.primaryColorString;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1)).then(
          (value) => SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
          statusBarBrightness: AppTheme.isLightTheme ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Colors.grey,
          systemNavigationBarIconBrightness: AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
        ),
      ),
    );
    return GetMaterialApp(
      scrollBehavior: const ScrollBehavior(androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
      navigatorKey: NavKey.navKey,
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }

  var routes = <String, WidgetBuilder>{
    Routes.SPLASH: (BuildContext context) => SplashScreen(),
    Routes.LOGIN: (BuildContext context) => LoginScreen(),
    Routes.HOME: (BuildContext context) => MainHomeScreen(),
    Routes.NOINTERNET: (BuildContext context) => NoInternetScreen(),
  };
}

class Routes {
  static String SPLASH = "/";
  static const LOGIN = "/Login/login_screen";
  static const HOME = "/Home/home_screen";
  static const NOINTERNET = "/Widgets/noInternet_Screen";
}

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}
