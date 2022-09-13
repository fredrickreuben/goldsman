// ignore_for_file: unnecessary_new, curly_braces_in_flow_control_structures

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Filter/filter_scree.dart';
import 'package:goldsman/Products/products_screen.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:goldsman/Constance/constance.dart' as constance;
import 'package:page_transition/page_transition.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Favorites> lstFavorites = [];
  List<Sort> lstSort = [];

  bool isLoading = false;
  bool isInGridView = false;

  String selectedType = "abaya";

  @override
  void initState() {
    super.initState();
    getFavoriteTypes();
  }

  getFavoriteTypes() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    for (var i = 0; i < 4; i++) {
      Favorites objFavorites = new Favorites();
      objFavorites.name = i == 0
          ? "Kitchen"
          : i == 1
              ? "Books"
              : i == 2
                  ? "Clothes"
                  : "Shirts";
      objFavorites.isSelected = i == 0 ? true : false;
      lstFavorites.add(objFavorites);
    }

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
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 120,
            child: Padding(
              padding: EdgeInsets.only(top: AppBar().preferredSize.height / 1.5 + 14),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 24,
                        ),
                        Text(
                          "Favorites",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 26,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const Icon(
                          Icons.search,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 45,
                    child: !isLoading
                        ? ListView.builder(
                            itemCount: lstFavorites.length,
                            padding: const EdgeInsets.only(left: 8),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        for (var element in lstFavorites) {
                                          element.isSelected = false;
                                        }
                                        lstFavorites[index].isSelected = true;
                                        selectedType = lstFavorites[index].name.toLowerCase();

                                        setState(() {
                                          isLoading = true;
                                        });
                                        await Future.delayed(const Duration(milliseconds: 500));

                                        setState(() {
                                          isLoading = false;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                        decoration: BoxDecoration(
                                          color: lstFavorites[index].isSelected ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
                                          borderRadius: BorderRadius.circular(24),
                                          border: Border.all(
                                            color: lstFavorites[index].isSelected ? Theme.of(context).primaryColor : HexColor("#727c8e"),
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          lstFavorites[index].name.toString(),
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: lstFavorites[index].isSelected ? Colors.white : HexColor("#727c8e"),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  )
                                ],
                              );
                            },
                          )
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: 8),
                            children: [
                              for (var i = 0; i < 5; i++)
                                Row(
                                  children: [
                                    ShimmerWidget(
                                      isLoading: isLoading,
                                      widget: Container(
                                        padding: const EdgeInsets.only(left: 80),
                                        decoration: new BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.grey[200],
                                        ),
                                        height: 80,
                                        width: 105,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                            ],
                          ),
                  ),
                  const SizedBox(
                    height: 16,
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
                        for (var i = 0; i < 6; i++)
                          !isLoading
                              ? Column(
                                  children: [
                                    selectedType == "abaya"
                                        ? Column(
                                            children: [
                                              Row(
                                                children: [
                                                  favorites(ConstanceData.photo, "(3)", "Abaya", "Soft Touch Abaya", "SAR 116"),
                                                  const SizedBox(width: 8),
                                                  favorites(ConstanceData.photo1, "(10)", "Abaya", "Casual abaya", "SAR 87"),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  favorites(ConstanceData.photo2, "(14)", "Abaya", "Abaya Blue split", "SAR 123"),
                                                  const SizedBox(width: 8),
                                                  favorites(ConstanceData.photo4, "(5)", "Abaya", "Green Split Abaya", "SAR 100",
                                                      isShowOffer: true, offerpercent: "15%"),
                                                ],
                                              ),
                                            ],
                                          )
                                        : selectedType == "sport"
                                            ? Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      favorites(ConstanceData.sports1, "(13)", "Sport", "Justice League", "SAR 116"),
                                                      const SizedBox(width: 8),
                                                      favorites(ConstanceData.sports2, "(100)", "Sport", "Fabric Track Suit", "SAR 87"),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      favorites(ConstanceData.sports3, "(14)", "Sport", "Full Fabric Track Suit", "SAR 123"),
                                                      const SizedBox(width: 8),
                                                      favorites(ConstanceData.sports4, "(5)", "Sport", "TShirt& Burmudas", "SAR 100",
                                                          isShowOffer: true, offerpercent: "30%"),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : selectedType == "jeans"
                                                ? Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          favorites(ConstanceData.jeans1, "(39)", "Jeans", "Men's Carrot Jeans", "SAR 116"),
                                                          const SizedBox(width: 8),
                                                          favorites(ConstanceData.jeans2, "(13)", "Jeans", "Women's Slim Jeans", "SAR 87"),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [
                                                          favorites(ConstanceData.jeans4, "(35)", "Jeans", "Women's Skinny Jeans", "SAR 123"),
                                                          const SizedBox(width: 8),
                                                          favorites(ConstanceData.jeans3, "(23)", "Jeans", "Men's Skinny Jeans", "SAR 100",
                                                              isShowOffer: true, offerpercent: "30%"),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [
                                                          favorites(ConstanceData.jeans5, "(124)", "Jeans", "Men's Regular Jeans", "SAR 123"),
                                                          const SizedBox(width: 8),
                                                          favorites(ConstanceData.jeans6, "(45)", "Jeans", "Women's Flared Jeans", "SAR 100"),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [
                                                          favorites(ConstanceData.jeans7, "(140)", "Jeans", "Full Fabric Track Suit", "SAR 123"),
                                                          const SizedBox(width: 8),
                                                          favorites(ConstanceData.jeans8, "(59)", "Jeans", "TShirt&Burmudas", "SAR 100",
                                                              isShowOffer: true, offerpercent: "30%"),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          favorites(ConstanceData.shirt1, "(39)", "Shirts", "American Sky", "SAR 116"),
                                                          const SizedBox(width: 8),
                                                          favorites(ConstanceData.shirt5, "(13)", "Shirts", "FUNDAY FASHION", "SAR 87"),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [
                                                          favorites(ConstanceData.shirt4, "(35)", "Shirts", "Diverse", "SAR 123"),
                                                          const SizedBox(width: 8),
                                                          favorites(ConstanceData.shirt3, "(23)", "Shirts", "Kesula", "SAR 100",
                                                              isShowOffer: true, offerpercent: "30%"),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [
                                                          favorites(ConstanceData.shirt2, "(124)", "Shirts", "Dennis Lingo", "SAR 123"),
                                                          const SizedBox(width: 8),
                                                          favorites(ConstanceData.shirt7, "(45)", "Shirts", "Classic Fit Shirt", "SAR 100"),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [
                                                          favorites(ConstanceData.shirt8, "(140)", "Shirts", "Casual Long Sleeves", "SAR 123"),
                                                          const SizedBox(width: 8),
                                                          favorites(ConstanceData.shirt6, "(59)", "Shirts", "Basic Stretchy", "SAR 100",
                                                              isShowOffer: true, offerpercent: "30%"),
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
                            selectedType == "abaya"
                                ? Column(
                                    children: [
                                      horizontalView(ConstanceData.photo, "H&M", "Soft Touch Abaya", "Blue", "L", "(11)"),
                                      horizontalView(ConstanceData.photo1, "H&M", "Casual abaya", "Light Pink", "M", "(14)"),
                                      horizontalView(ConstanceData.photo2, "H&M", "Abaya Blue split", "Sky", "L", "(2)"),
                                      horizontalView(ConstanceData.photo4, "H&M", "Green Split Abaya", "Green", "S", "(24)"),
                                    ],
                                  )
                                : selectedType == "sport"
                                    ? Column(
                                        children: [
                                          horizontalView(ConstanceData.sports1, "Sport", "Justice League", "Grey", "L", "(11)"),
                                          horizontalView(ConstanceData.sports2, "Sport", "Fabric Track Suit", "Black", "M", "(14)"),
                                          horizontalView(ConstanceData.sports3, "Sport", "Full Fabric Track Suit", "Light Green", "L", "(2)"),
                                          horizontalView(ConstanceData.sports4, "Sport", "TShirt& Burmudas", "Grey & Black", "S", "(24)"),
                                        ],
                                      )
                                    : selectedType == "Jeans"
                                        ? Column(
                                            children: [
                                              horizontalView(ConstanceData.jeans1, "Jeans", "Men's Carrot Jeans", "Black", "L", "(3)"),
                                              horizontalView(ConstanceData.jeans2, "Jeans", "Women's Slim Jeans", "Blue", "M", "(5)"),
                                              horizontalView(ConstanceData.jeans3, "Jeans", "Men's Skinny Jeans", "Grey", "L", "(20)"),
                                              horizontalView(ConstanceData.jeans4, "Jeans", "Women's Skinny Jeans", "Blue", "S", "(12)"),
                                              horizontalView(ConstanceData.jeans5, "Jeans", "Men's Regular Jeans", "Grey", "S", "(45)"),
                                              horizontalView(ConstanceData.jeans6, "Jeans", "Women's Flared Jeans", "Blue", "S", "(22)"),
                                              horizontalView(ConstanceData.jeans7, "Jeans", "Full Fabric Track Suit", "White", "S", "(6)"),
                                              horizontalView(ConstanceData.jeans8, "Jeans", "TShirt&Burmudas", "Dark Blue", "S", "(9)"),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              horizontalView(ConstanceData.shirt1, "Men shirt", "American Sky", "Maroon", "L", "(3)"),
                                              horizontalView(ConstanceData.shirt2, "Men shirt", "Dennis Lingo", "Light Pink", "M", "(5)"),
                                              horizontalView(ConstanceData.shirt3, "Men shirt", "Kesulas", "Orange & White", "L", "(20)"),
                                              horizontalView(ConstanceData.shirt4, "Men shirt", "Diverse", "Green", "S", "(12)"),
                                              horizontalView(ConstanceData.shirt5, "Woomen shirt", "FUNDAY FASHION", "Light Orange", "S", "(45)"),
                                              horizontalView(ConstanceData.shirt6, "Woomen shirt", "Basic Stretchy", "Maroon", "S", "(22)"),
                                              horizontalView(ConstanceData.shirt7, "Woomen shirt", "Classic Fit Shirt", "Black", "S", "(6)"),
                                              horizontalView(ConstanceData.shirt8, "Woomen shirt", "Casual Long Sleeves", "Green", "S", "(9)"),
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

  afterSort() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      isLoading = false;
    });
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

  Widget customeColumnShimmer() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[200],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 49),
          child: Container(
            width: 50,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        )
      ],
    );
  }
}

class Favorites {
  String name;
  bool isSelected;

  Favorites({
    this.name = "",
    this.isSelected = false,
  });
}

class Sort {
  String name;
  bool isSelected;

  Sort({
    this.name = "",
    this.isSelected = false,
  });
}
