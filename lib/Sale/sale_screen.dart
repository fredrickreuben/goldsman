// ignore_for_file: constant_identifier_names, prefer_const_constructors, unnecessary_new

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Favorite/favorite_screen.dart';
import 'package:goldsman/Filter/filter_scree.dart';
import 'package:goldsman/Products/products_screen.dart';
import 'package:goldsman/Sale/search_screen.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:goldsman/Constance/constance.dart' as constance;

class SaleScreen extends StatefulWidget {
  const SaleScreen({Key? key}) : super(key: key);

  @override
  _SaleScreenState createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  PersonType enumPersonType = PersonType.Men;

  bool isLoading = false;
  bool isInGridView = false;

  List<Sort> lstSort = [];

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
    for (var i = 0; i < 5; i++) {
      Sort objSort = new Sort();
      i == 0
          ? objSort.name = "Popular"
          : i == 1
              ? objSort.name = "Newest"
              : i == 2
                  ? objSort.name = "Customer review"
                  : i == 3
                      ? objSort.name = "Price: lowest to high"
                      : objSort.name = "Price: highest to low";
      i == 0 ? objSort.isSelected = true : objSort.isSelected = false;
      lstSort.add(objSort);
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
            height: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + 135,
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 14),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
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
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppTheme.isLightTheme ? Colors.black : Colors.white,
                          ),
                        ),
                        Text(
                          "Summer Sale",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 24,
                              ),
                        ),
                        InkWell(
                          onTap: () {
                            /*Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                duration: const Duration(milliseconds: 500),
                                child: const SearchScreen(),
                              ),
                            );*/
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
                  const SizedBox(height: 20),
                  /*Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Row(
                      children: [
                        type(PersonType.Men),
                        SizedBox(width: 8),
                        type(PersonType.Women),
                        SizedBox(width: 8),
                        type(PersonType.Kids),
                      ],
                    ),
                  ),*/
                  const SizedBox(
                    height: 12,
                  ),
                  /*Container(
                    color: HexColor("#fce8b6"),
                    height: 32,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 14, left: 14),
                      child: Row(
                        children: [
                          Icon(
                            Icons.message_sharp,
                            size: 20,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "WE ARE OPEN: COVID-19-Limit Orders (more info)",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                  const SizedBox(
                    height: 12,
                  ),
                  /*Padding(
                    padding: const EdgeInsets.only(right: 14, left: 14),
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
                          child: filters("Filters", ConstanceData.filter, 24, Theme.of(context).textTheme.bodyLarge!.color!),
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              builder: (builder) {
                                return StatefulBuilder(builder: (context, setState) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Container(
                                        height: 6,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).disabledColor,
                                          borderRadius: BorderRadius.circular(24),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "Sort by",
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(height: 14),
                                      Expanded(
                                        child: ListView(
                                          padding: const EdgeInsets.all(0),
                                          children: [
                                            for (var i = 0; i < lstSort.length; i++)
                                              InkWell(
                                                onTap: () async {
                                                  for (var element in lstSort) {
                                                    element.isSelected = false;
                                                  }
                                                  lstSort[i].isSelected = true;
                                                  setState(() {});
                                                  await Future.delayed(const Duration(milliseconds: 500));
                                                  Navigator.pop(context);
                                                  await afterSort();
                                                },
                                                child: sort(
                                                  lstSort[i].name,
                                                  lstSort[i].isSelected,
                                                ),
                                              ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                });
                              },
                            );
                          },
                          child: filters("Sort", ConstanceData.price, 24, Theme.of(context).textTheme.bodyLarge!.color!),
                        ),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await Future.delayed(const Duration(milliseconds: 500));
                            isInGridView = !isInGridView;
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: filters("Grid", ConstanceData.grid, 18,
                              isInGridView ? Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyLarge!.color!),
                        ),
                      ],
                    ),
                  )*/
                ],
              ),
            ),
          ),
          /*Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: !isInGridView
                  ? ListView(
                      padding: const EdgeInsets.only(right: 14, left: 14, top: 14),
                      children: [
                        for (var i = 0; i < 3; i++)
                          !isLoading
                              ? Column(
                                  children: [
                                    enumPersonType == PersonType.Men
                                        ? Column(
                                            children: [
                                              Row(
                                                children: [
                                                  favorites(ConstanceData.menSummer1, "(3)", "NB", "T-Shirt NB", "SAR 120"),
                                                  const SizedBox(width: 8),
                                                  favorites(ConstanceData.menSummer2, "(10)", "Adidas", "Adidas Black", "SAR 147"),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  favorites(ConstanceData.menSummer3, "(14)", "Nike", "Nike T-Shirt Black", "SAR 142"),
                                                  const SizedBox(width: 8),
                                                  favorites(ConstanceData.menSummer4, "(5)", "Adidas", "Adidas Cyan Sports", "SAR 65",
                                                      isShowOffer: true, offerpercent: "New"),
                                                ],
                                              ),
                                            ],
                                          )
                                        : enumPersonType == PersonType.Women
                                            ? Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      favorites(ConstanceData.photo, "(20)", "Abaya", "Soft Touch Abaya", "SAR 116"),
                                                      const SizedBox(width: 8),
                                                      favorites(ConstanceData.photo1, "(13)", "Abaya", "Casual abaya", "SAR 87",
                                                          isShowOffer: true, offerpercent: "30%"),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      favorites(ConstanceData.photo2, "(45)", "Abaya", "Abaya With Blue split", "SAR 123"),
                                                      const SizedBox(width: 8),
                                                      favorites(ConstanceData.photo4, "(78)", "Abaya", "Green Contrast Abaya", "SAR 100"),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      favorites(ConstanceData.kidSummer1, "(3)", "PEE LEE", "Textured T-shirt", "SAR 23"),
                                                      const SizedBox(width: 8),
                                                      favorites(ConstanceData.kidSummer2, "(10)", "PEE LEE", "Solid Oxford", "SAR 65"),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      favorites(ConstanceData.kidSummer3, "(12)", "PEE LEE", "Sweatshirt", "SAR 123",
                                                          isShowOffer: true, offerpercent: "20%"),
                                                      const SizedBox(width: 8),
                                                      favorites(ConstanceData.kidSummer4, "(45)", "PEE LEE", "Polka dot dress", "SAR 100"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                  ],
                                )
                              : ShimmerWidget(
                                  isLoading: isLoading,
                                  widget: Column(
                                    children: [
                                      Container(
                                        height: 120,
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
                                          color: Colors.grey[200],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                    ],
                                  ),
                                ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 16,
                        )
                      ],
                    )
                  : !isLoading
                      ? ListView(
                          // physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(right: 14, left: 14, top: 14),
                          children: [
                            enumPersonType == PersonType.Men
                                ? Column(
                                    children: [
                                      horizontalView(ConstanceData.menSummer1, "NB", "T-Shirt NB", "Blue", "L", "(3)"),
                                      horizontalView(ConstanceData.menSummer2, "Adidas", "Adidas Black", "Black", "M", "(10)"),
                                      horizontalView(ConstanceData.menSummer3, "Nike", "Nike T-Shirt Black", "Black", "L", "(14)"),
                                      horizontalView(ConstanceData.menSummer4, "Adidas", "Adidas Cyan Sports", "Light Blue", "S", "(5)"),
                                    ],
                                  )
                                : enumPersonType == PersonType.Women
                                    ? Column(
                                        children: [
                                          horizontalView(ConstanceData.photo, "Abaya", "Soft Touch Abaya", "Blue", "L", "(11)"),
                                          horizontalView(ConstanceData.photo1, "Abaya", "Casual abaya", "Crim", "M", "(14)"),
                                          horizontalView(ConstanceData.photo2, "Abaya", "Abaya With Blue split", "Light Green", "L", "(2)"),
                                          horizontalView(ConstanceData.photo4, "Abaya", "Green Contrast Abaya", "Green", "S", "(24)"),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          horizontalView(ConstanceData.kidSummer1, "PEE LEE", "Textured T-shirt", "Blue", "L", "(3)"),
                                          horizontalView(ConstanceData.kidSummer2, "PEE LEE", "Solid Oxford", "Light Pink", "M", "(5)"),
                                          horizontalView(ConstanceData.kidSummer3, "PEE LEE", "Sweatshirt", "Black & White", "L", "(20)"),
                                          horizontalView(ConstanceData.kidSummer4, "PEE LEE", "Polka dot dress", "Orange", "S", "(12)"),
                                        ],
                                      ),
                          ],
                        )
                      : ListView(
                          padding: const EdgeInsets.only(right: 14, left: 14, top: 14),
                          children: [
                            for (var i = 0; i < 3; i++)
                              ShimmerWidget(
                                isLoading: isLoading,
                                widget: loadingItems(),
                              ),
                          ],
                        ),
            ),
          )*/
        ],
      ),
    );
  }

  Widget horizontalView(String image, String productTitle, String productName, String color, String size, String review) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            duration: const Duration(milliseconds: 500),
            child: ProductsScreen(
              imagePath: image,
              productDetail: productTitle,
              productname: productName,
              reviews: review,
              type: size,
            ),
          ),
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.07),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      ),
                      child: Image.asset(
                        image,
                        height: 120,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productTitle,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 14,
                                color: HexColor("#9B9B9B"),
                              ),
                        ),
                        Text(
                          productName,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Color: ",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 16,
                                    color: HexColor("#9B9B9B"),
                                  ),
                            ),
                            Text(
                              color,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Text(
                              "Size: ",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 16,
                                    color: HexColor("#9B9B9B"),
                                  ),
                            ),
                            Text(
                              size,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              "SAR 72",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            for (var i = 0; i < 5; i++)
                              Icon(
                                Icons.star,
                                size: 16,
                                color: HexColor("#ffba49"),
                              ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              review,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 14,
                                    color: HexColor("#9b9b9b"),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    constance.openSnackBar(context, "Item added in Cart", SnackBarTye.succsess, isVibrate: true);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.grey,
                          spreadRadius: 0.3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2, left: 2),
                        child: Image.asset(ConstanceData.cart2, height: 24, color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey, spreadRadius: 0.3, offset: Offset(0, 2))],
                  ),
                  child: LikeButton(
                    size: 35,
                    circleColor: const CircleColor(
                      start: Color.fromARGB(255, 255, 0, 0),
                      end: Color.fromARGB(255, 255, 0, 0),
                    ),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: Color.fromARGB(255, 255, 0, 0),
                      dotSecondaryColor: Color.fromARGB(255, 255, 0, 0),
                    ),
                    likeBuilder: (bool isLiked) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 3, top: 3),
                        child: Icon(
                          !isLiked ? Icons.favorite : Icons.favorite_border,
                          color: !isLiked ? const Color.fromARGB(255, 255, 0, 0) : Colors.grey,
                          size: 20,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget favorites(String imagePath, String reviews, String type, String productname, String productDetail,
      {bool isShowOffer = false, String offerpercent = ""}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeftWithFade,
              duration: const Duration(milliseconds: 500),
              child: ProductsScreen(
                imagePath: imagePath,
                productDetail: productDetail,
                productname: productname,
                reviews: reviews,
                type: type,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          imagePath,
                          height: 200,
                        ),
                        isShowOffer
                            ? Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Container(
                                  decoration: BoxDecoration(color: HexColor("#08be51")),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 4, top: 2, bottom: 2),
                                    child: Text(
                                      offerpercent,
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        for (var i = 0; i < 4; i++)
                          Icon(
                            Icons.star,
                            size: 16,
                            color: HexColor("#ffba49"),
                          ),
                        Icon(
                          Icons.star_border,
                          size: 16,
                          color: HexColor("#9b9b9b"),
                        ),
                        Text(
                          reviews,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 14,
                                color: HexColor("#9b9b9b"),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18, right: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          constance.openSnackBar(context, "Item added in Cart", SnackBarTye.succsess, isVibrate: true);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.grey,
                                spreadRadius: 0.3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Theme.of(context).backgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, left: 2),
                              child: Image.asset(ConstanceData.cart2, height: 24, color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey, spreadRadius: 0.3, offset: Offset(0, 2))],
                        ),
                        child: LikeButton(
                          size: 35,
                          circleColor: const CircleColor(
                            start: Color.fromARGB(255, 255, 0, 0),
                            end: Color.fromARGB(255, 255, 0, 0),
                          ),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color.fromARGB(255, 255, 0, 0),
                            dotSecondaryColor: Color.fromARGB(255, 255, 0, 0),
                          ),
                          likeBuilder: (bool isLiked) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 3, top: 3),
                              child: Icon(
                                !isLiked ? Icons.favorite : Icons.favorite_border,
                                color: !isLiked ? const Color.fromARGB(255, 255, 0, 0) : Colors.grey,
                                size: 20,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              type,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 14,
                    color: HexColor("#9b9b9b"),
                  ),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(
              productname,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              productDetail,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingItems() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 190,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 20,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 20,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 20,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 190,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 20,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 20,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 20,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  Widget sort(String text, bool isSelect) {
    return Container(
      color: isSelect ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(right: 14, left: 14, top: 12, bottom: 12),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 20,
                color: isSelect ? Theme.of(context).backgroundColor : Theme.of(context).textTheme.bodyText2!.color,
              ),
        ),
      ),
    );
  }

  afterSort() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      isLoading = false;
    });
  }

  Widget filters(String text, String imagePath, double imageSize, Color colors) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: imageSize,
          color: colors,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 18,
                color: colors,
              ),
        ),
      ],
    );
  }

  Widget type(PersonType enumPersonTypes) {
    return !isLoading
        ? Expanded(
            child: InkWell(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(const Duration(milliseconds: 1000));
                setState(() {
                  isLoading = false;
                  enumPersonType = enumPersonTypes;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: enumPersonType == enumPersonTypes ? Theme.of(context).primaryColor : HexColor("#f3f4f4"),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: Text(
                      enumPersonTypes.name,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: enumPersonType == enumPersonTypes ? Colors.white : HexColor("#a6a6a6"),
                          ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Expanded(
            child: ShimmerWidget(
              isLoading: isLoading,
              widget: Container(
                height: 40,
                padding: const EdgeInsets.only(left: 51, right: 51),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
  }
}

enum PersonType {
  Men,
  Women,
  Kids,
}
