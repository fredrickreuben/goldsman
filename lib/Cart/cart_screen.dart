// ignore_for_file: unnecessary_new, unnecessary_null_comparison

import 'package:goldsman/Cart/checkout_screen.dart';
import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:goldsman/Constance/constance.dart' as constance;
import 'package:page_transition/page_transition.dart';

class CartScreen extends StatefulWidget {
  final AnimationController? animationController;

  const CartScreen({Key? key, this.animationController}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController ctrlPromo = new TextEditingController();

  List<MyCart> lstMyCart = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getCart();
  }

  getCart() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    for (var i = 0; i < 3; i++) {
      MyCart objMyCart = new MyCart();
      objMyCart.image = i == 0
          ? ConstanceData.cart1
          : i == 1
              ? ConstanceData.carts2
              : i == 2
                  ? ConstanceData.cart3
                  : i == 3
                      ? ConstanceData.cart4
                      : ConstanceData.cart4;
      objMyCart.totalItems = i;

      objMyCart.itemName = i == 0
          ? "Sweatshirt"
          : i == 1
              ? "T-Shirt NB"
              : i == 2
                  ? "Soft Touch Abaya"
                  : i == 3
                      ? "Solid Oxford"
                      : "Solid Oxford";

      objMyCart.subDetail = i == 0
          ? "SAR 73"
          : i == 1
              ? "SAR 125"
              : i == 2
                  ? "SAR 61"
                  : i == 3
                      ? "SAR 28"
                      : "SAR 28";

      lstMyCart.add(objMyCart);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
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
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "My Cart",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 24,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              "4",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                          Image.asset(ConstanceData.Cart, height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 14, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My cart list",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          color: HexColor("#515C6F"),
                        ),
                  ),
                  Text(
                    "Delete All",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                  ),
                ],
              ),
            ),
            /*Expanded(
              child: !isLoading
                  ? Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        ListView(
                          padding: const EdgeInsets.only(top: 14),
                          children: [
                            for (var i = 0; i < lstMyCart.length; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 14, left: 14),
                                child: myCartDetail(
                                    lstMyCart[i].image,
                                    lstMyCart[i].itemName,
                                    lstMyCart[i].subDetail,
                                    lstMyCart[i].totalItems,
                                    i),
                              ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 14, left: 14),
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Theme.of(context).backgroundColor,
                                  boxShadow: [
                                    AppTheme.isLightTheme
                                        ? BoxShadow(
                                            color:
                                                Colors.grey.withOpacity(0.07),
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
                                      child: TextFormField(
                                        controller: ctrlPromo,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.only(left: 18),
                                          hintText: "Enter your promo code",
                                          border: InputBorder.none,
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.grey,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: InkWell(
                                        onTap: () {
                                          if (ctrlPromo.text == null ||
                                              ctrlPromo.text == "") {
                                            constance.openSnackBar(
                                                context,
                                                "Enter promocode",
                                                SnackBarTye.error,
                                                isVibrate: true);
                                          } else {
                                            FocusScope.of(context)
                                                .requestFocus(FocusNode());
                                            constance.openSnackBar(
                                                context,
                                                "Promocode Apply",
                                                SnackBarTye.succsess,
                                                isVibrate: true);
                                          }
                                        },
                                        child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          child: const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 14, left: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Order:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey,
                                        ),
                                  ),
                                  Text(
                                    "SAR 311.70",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 14, left: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.grey,
                                        ),
                                  ),
                                  Text(
                                    "SAR 17.70",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 120,
                            ),
                          ],
                        ),
                        Container(
                          height: 90,
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
                            padding: const EdgeInsets.only(right: 14, left: 14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "TOTAL",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "SAR 324.70",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Free Shipping",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                    ),
                                  ],
                                ),
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
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            child: const CheckoutScreen(),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(),
                                            Text(
                                              "CHECK OUT",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 15,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView(
                      padding:
                          const EdgeInsets.only(top: 14, right: 14, left: 14),
                      children: [
                        for (var i = 0; i < 4; i++)
                          ShimmerWidget(
                            isLoading: isLoading,
                            widget: Column(
                              children: [
                                Container(
                                  height: 125,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 51, right: 51),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget myCartDetail(String image, String title, String subTitle,
      int totalItem, int objNumber) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(16),
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
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Image.asset(image, height: 100),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: AppTheme.isLightTheme
                            ? HexColor("#f0f0f0")
                            : Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 6, top: 6, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                lstMyCart[objNumber].totalItems =
                                    lstMyCart[objNumber].totalItems + 1;
                                setState(() {});
                                constance.openSnackBar(context,
                                    "Your Item Added", SnackBarTye.succsess,
                                    isVibrate: true);
                              },
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                            Text(
                              totalItem.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            InkWell(
                              onTap: () {
                                lstMyCart[objNumber].totalItems =
                                    lstMyCart[objNumber].totalItems - 1;
                                setState(() {});
                                constance.openSnackBar(
                                    context, "Item Removed", SnackBarTye.error,
                                    isVibrate: true);
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        )
      ],
    );
  }
}

class MyCart {
  String image;
  String itemName;
  String subDetail;
  int totalItems;

  MyCart({
    this.image = '',
    this.itemName = '',
    this.subDetail = '',
    this.totalItems = 0,
  });
}
