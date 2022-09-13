// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:goldsman/Constance/constance.dart' as constance;

class ProductsScreen extends StatefulWidget {
  final String imagePath;
  final String reviews;
  final String type;
  final String productname;
  final String productDetail;
  const ProductsScreen(
      {Key? key, required this.imagePath, required this.reviews, required this.type, required this.productname, required this.productDetail})
      : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String dropdownValue = 'Size';
  String dropdowncolor = 'Color';
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
            height: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + 14,
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
                        Icon(
                          Icons.share,
                          color: AppTheme.isLightTheme ? Colors.black : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 0),
              children: [
                Image.asset(
                  widget.imagePath,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
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
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const SizedBox(),
                                  elevation: 20,
                                  underline: const SizedBox(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>['Size', 'L', 'M', 'S', 'XXL', 'XXXL'].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                              fontSize: 18,
                                              color: HexColor("#515C6F"),
                                            ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              const Icon(
                                Icons.keyboard_arrow_down_outlined,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
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
                        child: Row(
                          children: [
                            Expanded(
                              child: DropdownButton<String>(
                                value: dropdowncolor,
                                icon: const SizedBox(),
                                elevation: 20,
                                underline: const SizedBox(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdowncolor = newValue!;
                                  });
                                },
                                items: <String>['Color', 'Red', 'White', 'Yellow', 'Green', 'Pink'].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontSize: 18,
                                            color: HexColor("#515C6F"),
                                          ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.keyboard_arrow_down_outlined,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey, spreadRadius: 0.3, offset: Offset(0, 2))],
                        ),
                        child: LikeButton(
                          size: 45,
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
                                size: 25,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 14, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.productname,
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            widget.productDetail + ".00",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      Text(
                        widget.type,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 18,
                              color: HexColor("#9b9b9b"),
                            ),
                      ),
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
                            widget.reviews,
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 14,
                                  color: HexColor("#9b9b9b"),
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 18,
                            ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Specifications",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 18,
                                ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 0.8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping info",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 18,
                                ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 0.8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Support",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 18,
                                ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 0.8,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You can also like this",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            "View All",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 18,
                                  color: HexColor("#9b9b9b"),
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      !isLoading
                          ? Row(
                              children: [
                                favorites(ConstanceData.menSummer1, "(3)", "NB", "T-Shirt NB", "SAR 120"),
                                const SizedBox(width: 8),
                                favorites(ConstanceData.menSummer3, "(10)", "Adidas", "Adidas Black", "SAR 147"),
                              ],
                            )
                          : ShimmerWidget(
                              isLoading: isLoading,
                              widget: loadingItems(),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),*/
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
                                isLiked ? Icons.favorite : Icons.favorite_border,
                                color: isLiked ? const Color.fromARGB(255, 255, 0, 0) : Colors.grey,
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
}
