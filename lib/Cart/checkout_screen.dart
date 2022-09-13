// ignore_for_file: unnecessary_new, unnecessary_null_comparison

import 'package:goldsman/Cart/addcard_screen.dart';
import 'package:goldsman/Cart/address_screen.dart';
import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Order/placeOrder_screen.dart';
import 'package:goldsman/Widgets/appbar.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:goldsman/Constance/constance.dart' as constance;

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController ctrlPromo = new TextEditingController();
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
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBarUI(
            isBackArrow: true,
            text: "Check Out",
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
          Padding(
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping Address",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 16,
                        color: HexColor("#515C6F"),
                      ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 500),
                        child: const AddressScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Change",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ListView(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
                  children: [
                    !isLoading
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
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
                                        color: Colors.transparent),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Majed Shammary",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "Edit",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                                fontSize: 16,
                                                color: HexColor("#515C6F")),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Riyadh, Saudi Arabia, 12375 Riyadh 21473",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontSize: 16,
                                        ),
                                  ),
                                  Text(
                                    "+966508595692",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontSize: 16,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(ConstanceData.checkbox,
                                          height: 20),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Use as the shipping address",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontSize: 16,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ShimmerWidget(
                            isLoading: isLoading,
                            widget: Column(
                              children: [
                                Container(
                                  height: 120,
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
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment Method",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 16,
                                    color: HexColor("#515C6F"),
                                  ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                duration: const Duration(milliseconds: 500),
                                child: const AddCard(),
                              ),
                            );
                          },
                          child: Text(
                            "Add",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    !isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  ConstanceData.payment1,
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  ConstanceData.payment2,
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  ConstanceData.payment3,
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  ConstanceData.payment4,
                                ),
                              )
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                loading(34),
                                const SizedBox(width: 8),
                                loading(34),
                                const SizedBox(width: 8),
                                loading(34),
                                const SizedBox(width: 8),
                                loading(34),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Card ending **** **** **** 7332",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16,
                            color: HexColor("#515C6F"),
                          ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    !isLoading
                        ? Row(
                            children: [
                              Expanded(
                                  child: Image.asset(ConstanceData.Group394)),
                              Expanded(
                                  child: Image.asset(ConstanceData.Group395)),
                              Expanded(
                                  child: Image.asset(ConstanceData.Group396)),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                loading(64),
                                const SizedBox(width: 8),
                                loading(64),
                                const SizedBox(width: 8),
                                loading(64),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: ctrlPromo,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 18),
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
                                  constance.openSnackBar(context,
                                      "Enter promocode", SnackBarTye.error,
                                      isVibrate: true);
                                } else {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  constance.openSnackBar(context,
                                      "Promocode Apply", SnackBarTye.succsess,
                                      isVibrate: true);
                                }
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Theme.of(context).primaryColor,
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
                    const SizedBox(
                      height: 24,
                    ),
                    orderDetail("Order:", "SAR 311.70"),
                    const SizedBox(height: 8),
                    orderDetail("Delivery:", "SAR 13.50"),
                    const SizedBox(height: 8),
                    orderDetail("Tax&vat:", "SAR 6.80"),
                    const SizedBox(height: 120),
                  ],
                ),
                Container(
                  height: 90 + MediaQuery.of(context).padding.bottom,
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
                            !isLoading
                                ? Text(
                                    "SAR 324.70",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )
                                : ShimmerWidget(
                                    isLoading: isLoading,
                                    widget: Container(
                                      height: 21,
                                      padding: const EdgeInsets.only(
                                          left: 51, right: 51),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              height: 2,
                            ),
                            !isLoading
                                ? Text(
                                    "Free Shipping",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                  )
                                : ShimmerWidget(
                                    isLoading: isLoading,
                                    widget: Container(
                                      height: 16,
                                      padding: const EdgeInsets.only(
                                          left: 51, right: 51),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
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
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration: const Duration(milliseconds: 500),
                                    child: const PlaceOrderScreen(),
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
                                      "Check Out",
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
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget loading(double height) {
    return Expanded(
      child: ShimmerWidget(
        isLoading: isLoading,
        widget: Container(
          height: height,
          padding: const EdgeInsets.only(left: 51, right: 51),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget orderDetail(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.grey,
              ),
        ),
        Text(
          price,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
