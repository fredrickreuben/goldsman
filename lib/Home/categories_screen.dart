// ignore_for_file: unnecessary_new

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Home/items_categories.dart';
import 'package:goldsman/Sale/search_screen.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<CategoriesType> lstCategoriesType = [];

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
    for (var i = 0; i < 4; i++) {
      CategoriesType objCategoriesType = new CategoriesType();
      objCategoriesType.age = i == 0
          ? "28-34"
          : i == 1
              ? "20-26"
              : i == 2
                  ? "15-19"
                  : i == 3
                      ? "Under 10"
                      : "Under 10";
      lstCategoriesType.add(objCategoriesType);
    }
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
            height: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + 14,
            child: Padding(
              padding: const EdgeInsets.only(top: 14, right: 14, left: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                          child: const SizedBox(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  Text(
                    "Categories",
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
                      color: AppTheme.isLightTheme ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*Expanded(
            child: ListView(
              padding: EdgeInsets.only(right: 14, bottom: MediaQuery.of(context).padding.bottom + 14),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14, top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Men",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      for (var i = 0; i < lstCategoriesType.length; i++) categoriesSize(lstCategoriesType[i].age),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    !isLoading
                        ? Column(
                            children: [
                              Image.asset(ConstanceData.men1, height: 70),
                              Image.asset(ConstanceData.men2, height: 70),
                              Image.asset(ConstanceData.men3, height: 70),
                              Image.asset(ConstanceData.men4, height: 70),
                              Image.asset(ConstanceData.men5, height: 70),
                              Image.asset(ConstanceData.men6, height: 70),
                              Image.asset(ConstanceData.men7, height: 70),
                              Image.asset(ConstanceData.men8, height: 70),
                            ],
                          )
                        : ShimmerWidget(
                            isLoading: isLoading,
                            widget: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 8),
                              child: Column(
                                children: [
                                  for (var i = 0; i < 8; i++) loadingImages(),
                                ],
                              ),
                            ),
                          ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 500),
                              child: const ItemsCategories(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14),
                                ),
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
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    !isLoading
                                        ? Text(
                                            "T-shirts",
                                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          )
                                        : ShimmerWidget(
                                            isLoading: isLoading,
                                            widget: Container(
                                              padding: const EdgeInsets.only(left: 80),
                                              decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              height: 16,
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(ConstanceData.arrow, height: 20),
                                  ],
                                ),
                              ),
                            ),
                            categoriesDetails("Shirts"),
                            categoriesDetails("Pants & Jeans"),
                            categoriesDetails("Socks & Ties"),
                            categoriesDetails("Underwear"),
                            categoriesDetails("Jackets"),
                            categoriesDetails("Coats"),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(14),
                                  bottomRight: Radius.circular(14),
                                ),
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
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    !isLoading
                                        ? Text(
                                            "Shoes",
                                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          )
                                        : ShimmerWidget(
                                            isLoading: isLoading,
                                            widget: Container(
                                              padding: const EdgeInsets.only(left: 80),
                                              decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              height: 16,
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(ConstanceData.arrow, height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Women",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      for (var i = 0; i < lstCategoriesType.length; i++) categoriesSize(lstCategoriesType[i].age),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    !isLoading
                        ? Column(
                            children: [
                              Image.asset(ConstanceData.women1, height: 70),
                              Image.asset(ConstanceData.women2, height: 70),
                              Image.asset(ConstanceData.women3, height: 70),
                              Image.asset(ConstanceData.women4, height: 70),
                              Image.asset(ConstanceData.women5, height: 70),
                              Image.asset(ConstanceData.women6, height: 70),
                            ],
                          )
                        : ShimmerWidget(
                            isLoading: isLoading,
                            widget: Padding(
                              padding: const EdgeInsets.only(left: 10, right: 8),
                              child: Column(
                                children: [
                                  for (var i = 0; i < 6; i++) loadingImages(),
                                ],
                              ),
                            ),
                          ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 500),
                              child: const ItemsCategories(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  topRight: Radius.circular(14),
                                ),
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
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    !isLoading
                                        ? Text(
                                            "Beauty",
                                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          )
                                        : ShimmerWidget(
                                            isLoading: isLoading,
                                            widget: Container(
                                              padding: const EdgeInsets.only(left: 80),
                                              decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              height: 16,
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(ConstanceData.arrow, height: 20),
                                  ],
                                ),
                              ),
                            ),
                            categoriesDetails("Shoes"),
                            categoriesDetails("Pants & Jeans"),
                            categoriesDetails("Dresses"),
                            categoriesDetails("Bags"),
                            Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(14),
                                  bottomRight: Radius.circular(14),
                                ),
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
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    !isLoading
                                        ? Text(
                                            "Jackets",
                                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          )
                                        : ShimmerWidget(
                                            isLoading: isLoading,
                                            widget: Container(
                                              padding: const EdgeInsets.only(left: 80),
                                              decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                              height: 16,
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(ConstanceData.arrow, height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }

  Widget loadingImages() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 80),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
          ),
          height: 50,
          width: 50,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget categoriesDetails(String title) {
    return Container(
      height: 70,
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
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            !isLoading
                ? Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                : ShimmerWidget(
                    isLoading: isLoading,
                    widget: Container(
                      padding: const EdgeInsets.only(left: 80),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 16,
                    ),
                  ),
            const SizedBox(
              width: 8,
            ),
            Image.asset(ConstanceData.arrow, height: 20),
          ],
        ),
      ),
    );
  }

  Widget categoriesSize(String size) {
    return Text(
      size,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: 18,
            color: HexColor("#c6cbd1"),
          ),
    );
  }
}

class CategoriesType {
  String age;
  bool isSelect;

  CategoriesType({
    this.age = "",
    this.isSelect = false,
  });
}
