// ignore_for_file: unused_field

import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:goldsman/Cart/cart_screen.dart';
import 'package:goldsman/Constance/constance.dart' as constance;
import 'package:connectivity/connectivity.dart';
import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Favorite/favorite_screen.dart';
import 'package:goldsman/Filter/filter_scree.dart';
import 'package:goldsman/Home/categories_screen.dart';
import 'package:goldsman/Order/myOrder_screen.dart';
import 'package:goldsman/Products/products_screen.dart';
import 'package:goldsman/Profile/profile_screen.dart';
import 'package:goldsman/Sale/sale_screen.dart';
import 'package:goldsman/Sale/search_screen.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:goldsman/main.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (mounted) setState(() {});
    if (result.index == 2) {
      constance.openSnackBar(
          context, "No Internet Connect !!!", SnackBarTye.error,
          isVibrate: true);
      Navigator.pushReplacementNamed(context, Routes.NOINTERNET);
      return;
    }
  }

  @override
  dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              ConstanceData.Home,
              height: 20,
              color: _selectedIndex == 0
                  ? Theme.of(context).primaryColor
                  : HexColor("#515C6F"),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ConstanceData.Path,
              height: 20,
              color: _selectedIndex == 1
                  ? Theme.of(context).primaryColor
                  : HexColor("#515C6F"),
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ConstanceData.Cart,
              height: 20,
              color: _selectedIndex == 2
                  ? Theme.of(context).primaryColor
                  : HexColor("#515C6F"),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              ConstanceData.Profile,
              height: 20,
              color: _selectedIndex == 3
                  ? Theme.of(context).primaryColor
                  : HexColor("#515C6F"),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            height: MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height +
                14,
            child: Padding(
              padding: const EdgeInsets.only(top: 14, right: 14, left: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                          child: const FilterScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      ConstanceData.filter1,
                      height: 20,
                      color:
                          AppTheme.isLightTheme ? Colors.black : Colors.white,
                    ),
                  ),
                  Text(
                    "Main Home",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                          child: const SearchScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      ConstanceData.search,
                      height: 20,
                      color:
                          AppTheme.isLightTheme ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(right: 14, left: 14),
              children: [
                !isLoading
                    ? CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                        ),
                        items: [
                            InkWell(
                                onTap: () {
                                  gotosaleScreen();
                                },
                                child: Container(
                                    height: 200,
                                    color: Colors.white,
                                    child: const Card(
                                        color: Colors.transparent,
                                        child: Center(child: Text('Slider'))))),
                            InkWell(
                                onTap: () {
                                  gotosaleScreen();
                                },
                                child: Container(
                                    height: 200,
                                    color: Colors.white,
                                    child: const Card(
                                        color: Colors.transparent,
                                        child: Center(child: Text('Slider')))))
                          ])
                    : ShimmerWidget(
                        isLoading: isLoading,
                        widget: Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 4, right: 4, bottom: 16),
                          child: Container(
                            height: 155,
                            padding: const EdgeInsets.only(left: 51, right: 51),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 20,
                            color: AppTheme.isLightTheme
                                ? HexColor("#515C6F")
                                : Colors.white,
                          ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            duration: const Duration(milliseconds: 500),
                            child: const CategoriesScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "See All",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                !isLoading
                    ? Row(
                        children: [
                          Expanded(child: Image.asset(ConstanceData.grey)),
                          Expanded(child: Image.asset(ConstanceData.grey)),
                          Expanded(child: Image.asset(ConstanceData.grey)),
                          Expanded(child: Image.asset(ConstanceData.grey)),
                          Expanded(child: Image.asset(ConstanceData.grey)),
                        ],
                      )
                    : ShimmerWidget(
                        isLoading: isLoading,
                        widget: Padding(
                          padding:
                              const EdgeInsets.only(top: 9, left: 4, right: 4),
                          child: Row(
                            children: [
                              for (var i = 0; i < 5; i++)
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      )
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                const SizedBox(height: 16),
                Text(
                  "Latest Sales",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 20,
                        color: AppTheme.isLightTheme
                            ? HexColor("#515C6F")
                            : Colors.white,
                      ),
                ),
                const SizedBox(height: 8),
                !isLoading
                    ? CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                        ),
                        items: [
                          InkWell(
                              onTap: () {
                                gotosaleScreen();
                              },
                              child: Container(
                                  height: 200,
                                  color: Colors.white,
                                  child: const Card(
                                      color: Colors.transparent,
                                      child: Center(child: Text('Slider'))))),
                          InkWell(
                              onTap: () {
                                gotosaleScreen();
                              },
                              child: Container(
                                  height: 200,
                                  color: Colors.white,
                                  child: const Card(
                                      color: Colors.transparent,
                                      child: Center(child: Text('Slider'))))),
                        ],
                      )
                    : ShimmerWidget(
                        isLoading: isLoading,
                        widget: Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: Container(
                            height: 180,
                            padding: const EdgeInsets.only(left: 51, right: 51),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Sales",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 20,
                            color: AppTheme.isLightTheme
                                ? HexColor("#515C6F")
                                : Colors.white,
                          ),
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                !isLoading
                    ? Row(
                        children: [
                          topSale(
                              ConstanceData.topSale1, "Adidas Grey", "SAR 220"),
                          const SizedBox(
                            width: 8,
                          ),
                          topSale(ConstanceData.topSale2, "Croc Handbag",
                              "SAR 220"),
                          const SizedBox(
                            width: 8,
                          ),
                          topSale(ConstanceData.topSale3, "Adidas raglan",
                              "SAR 220"),
                        ],
                      )
                    : ShimmerWidget(
                        isLoading: isLoading,
                        widget: Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: loadingTopSale(),
                        ),
                      ),
                const SizedBox(height: 12),
                !isLoading
                    ? CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.5,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                        ),
                        items: [
                          InkWell(
                              onTap: () {
                                gotosaleScreen();
                              },
                              child: Image.asset(ConstanceData.Adscard1,
                                  fit: BoxFit.fitWidth)),
                          InkWell(
                              onTap: () {
                                gotosaleScreen();
                              },
                              child: Image.asset(ConstanceData.Adscard2,
                                  fit: BoxFit.fitWidth)),
                          InkWell(
                              onTap: () {
                                gotosaleScreen();
                              },
                              child: Image.asset(ConstanceData.Adscard3,
                                  fit: BoxFit.fitWidth)),
                        ],
                      )
                    : ShimmerWidget(
                        isLoading: isLoading,
                        widget: Padding(
                          padding:
                              const EdgeInsets.only(left: 2, right: 2, top: 16),
                          child: Container(
                            height: 90,
                            padding: const EdgeInsets.only(left: 51, right: 51),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "T Shirt",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 20,
                            color: AppTheme.isLightTheme
                                ? HexColor("#515C6F")
                                : Colors.white,
                          ),
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                !isLoading
                    ? Row(
                        children: [
                          tShirts(ConstanceData.tshirt1, "Adidas Run Grey",
                              "SAR 220"),
                          const SizedBox(
                            width: 8,
                          ),
                          tShirts(
                              ConstanceData.tshirt2, "Croc Handbag", "SAR 220",
                              isShowNewTag: true),
                          const SizedBox(
                            width: 8,
                          ),
                          tShirts(ConstanceData.tshirt3, "Adidas raglan",
                              "SAR 220"),
                        ],
                      )
                    : ShimmerWidget(
                        isLoading: isLoading,
                        widget: Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var i = 0; i < 3; i++) loadingShimmer(),
                            ],
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shoes",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 20,
                            color: AppTheme.isLightTheme
                                ? HexColor("#515C6F")
                                : Colors.white,
                          ),
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                !isLoading
                    ? Row(
                        children: [
                          tShirts(ConstanceData.shoes3, "Adidas Run Grey",
                              "SAR 220"),
                          const SizedBox(
                            width: 8,
                          ),
                          tShirts(
                              ConstanceData.shoes1, "Croc Handbag", "SAR 220",
                              isShowNewTag: true),
                          const SizedBox(
                            width: 8,
                          ),
                          tShirts(
                              ConstanceData.shoes2, "Adidas raglan", "SAR 220"),
                        ],
                      )
                    : ShimmerWidget(
                        isLoading: isLoading,
                        widget: Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (var i = 0; i < 3; i++) loadingShimmer(),
                            ],
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent View",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 20,
                            color: AppTheme.isLightTheme
                                ? HexColor("#515C6F")
                                : Colors.white,
                          ),
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                !isLoading
                    ? Row(
                        children: [
                          topSale(
                              ConstanceData.topSale1, "Adidas Grey", "SAR 220"),
                          const SizedBox(
                            width: 8,
                          ),
                          topSale(ConstanceData.topSale2, "Croc Handbag",
                              "SAR 220"),
                          const SizedBox(
                            width: 8,
                          ),
                          topSale(ConstanceData.topSale3, "Adidas raglan",
                              "SAR 220"),
                        ],
                      )
                    : ShimmerWidget(
                        isLoading: isLoading,
                        widget: Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: loadingTopSale(),
                        ),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  gotosaleScreen() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeftWithFade,
        duration: const Duration(milliseconds: 500),
        child: const SaleScreen(),
      ),
    );
  }

  Widget loadingTopSale() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 175,
          padding: const EdgeInsets.only(left: 51, right: 51),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Container(
          height: 175,
          padding: const EdgeInsets.only(left: 51, right: 51),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Container(
          height: 175,
          padding: const EdgeInsets.only(left: 51, right: 51),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }

  Widget loadingShimmer() {
    return Container(
      height: 145,
      padding: const EdgeInsets.only(left: 51, right: 51),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget topSale(String image, String brandName, String price) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              duration: const Duration(milliseconds: 500),
              child: ProductsScreen(
                imagePath: image,
                productDetail: price,
                productname: brandName,
                reviews: "10",
                type: brandName,
              ),
            ),
          );
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(12),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  height: 100,
                  width: 100,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  brandName,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        color: AppTheme.isLightTheme
                            ? HexColor("#515C6F")
                            : Colors.white,
                      ),
                ),
                Text(
                  price,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tShirts(String image, String brandName, String price,
      {bool isShowNewTag = false}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              duration: const Duration(milliseconds: 500),
              child: ProductsScreen(
                imagePath: image,
                productDetail: price,
                productname: brandName,
                reviews: "10",
                type: brandName,
              ),
            ),
          );
        },
        child: Container(
          height: 145,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(12),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isShowNewTag
                        ? Text(
                            "New",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor,
                                    ),
                          )
                        : const SizedBox(),
                    InkWell(
                      onTap: () {
                        constance.openSnackBar(
                            context, "Addedd in Cart", SnackBarTye.succsess);
                      },
                      child: Image.asset(ConstanceData.addCart, height: 22),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Image.asset(image, height: 60, width: 60),
                const Expanded(child: SizedBox()),
                Text(
                  brandName,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        color: AppTheme.isLightTheme
                            ? HexColor("#515C6F")
                            : Colors.white,
                      ),
                ),
                Text(
                  price,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
