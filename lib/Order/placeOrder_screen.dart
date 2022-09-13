// ignore_for_file: file_names

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Order/succsess_order.dart';
import 'package:goldsman/Widgets/appbar.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({Key? key}) : super(key: key);

  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  bool isLoading = false;

  ChooseOption enumChooseOption = ChooseOption.succsess;

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
            text: "Place Order",
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
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ListView(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
                  children: [
                    Text(
                      "Items",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16,
                            color: HexColor("#515C6F"),
                          ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 180,
                      child: !isLoading
                          ? ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                placeOrder(ConstanceData.placeOrder1,
                                    "Linear Neat Tee", "SAR 105"),
                                const SizedBox(width: 16),
                                placeOrder(ConstanceData.placeOrder2,
                                    "Nike T-Shirt Black", "SAR 87"),
                                const SizedBox(width: 16),
                                placeOrder(ConstanceData.placeOrder3,
                                    "Adidas Cyan Sports", "SAR 135"),
                              ],
                            )
                          : ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (var i = 0; i < 4; i++)
                                  Row(
                                    children: [
                                      ShimmerWidget(
                                        isLoading: isLoading,
                                        widget: Column(
                                          children: [
                                            Container(
                                              height: 130,
                                              width: 120,
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 8),
                                              decoration: BoxDecoration(
                                                color:
                                                    Theme.of(context).cardColor,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              height: 14,
                                              width: 115,
                                              padding: const EdgeInsets.only(
                                                  left: 51, right: 51),
                                              decoration: BoxDecoration(
                                                color:
                                                    Theme.of(context).cardColor,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              height: 14,
                                              width: 115,
                                              padding: const EdgeInsets.only(
                                                  left: 51, right: 51),
                                              decoration: BoxDecoration(
                                                color:
                                                    Theme.of(context).cardColor,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                    ],
                                  ),
                              ],
                            ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    title("Shipping address", "Change"),
                    const Divider(),
                    !isLoading
                        ? Text(
                            "Riyadh, Saudi Arabia, 12375 Riyadh 21473 +966508595692",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 17,
                                    ),
                          )
                        : ShimmerWidget(
                            isLoading: isLoading,
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 19,
                                  padding: const EdgeInsets.only(
                                      left: 51, right: 51),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  height: 19,
                                  width: 110,
                                  padding: const EdgeInsets.only(
                                      left: 51, right: 51),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 28,
                    ),
                    title("Delivery details", "Change"),
                    const Divider(),
                    !isLoading
                        ? Text(
                            "Standard Delivery\nSun 11 - Wed 27\nCost: SAR 42.63",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 17,
                                    ),
                          )
                        : ShimmerWidget(
                            isLoading: isLoading,
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 19,
                                  width: 110,
                                  padding: const EdgeInsets.only(
                                      left: 51, right: 51),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  height: 19,
                                  width: 110,
                                  padding: const EdgeInsets.only(
                                      left: 51, right: 51),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  height: 19,
                                  width: 110,
                                  padding: const EdgeInsets.only(
                                      left: 51, right: 51),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 28,
                    ),
                    title("Payment Method", "Change"),
                    const Divider(),
                    !isLoading
                        ? Row(
                            children: [
                              Image.asset(ConstanceData.payment3, height: 50),
                              Text(
                                "**** **** **** 7332",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 17,
                                    ),
                              ),
                            ],
                          )
                        : ShimmerWidget(
                            isLoading: isLoading,
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  padding: const EdgeInsets.only(
                                      left: 51, right: 51),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                showGeneralDialog(
                                  transitionBuilder: (context, a1, a2, widget) {
                                    return Transform.scale(
                                      scale: a1.value,
                                      child: Opacity(
                                        opacity: a1.value,
                                        child: AlertDialog(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0)),
                                          title: Center(
                                            child: Text(
                                              'Choose Payment Option',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Divider(height: 30),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .rightToLeftWithFade,
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      child:
                                                          const SuccsessOrderScreen(
                                                        enumChooseOption:
                                                            ChooseOption
                                                                .succsess,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: selectOption('Succsess'),
                                              ),
                                              const Divider(height: 30),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .rightToLeftWithFade,
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      child:
                                                          const SuccsessOrderScreen(
                                                        enumChooseOption:
                                                            ChooseOption
                                                                .paymrntError,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: selectOption(
                                                    'Payment Error'),
                                              ),
                                              const Divider(height: 30),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .rightToLeftWithFade,
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      child:
                                                          const SuccsessOrderScreen(
                                                        enumChooseOption:
                                                            ChooseOption
                                                                .orderNotComplete,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: selectOption(
                                                    'Order Not Complete'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  transitionDuration:
                                      const Duration(milliseconds: 200),
                                  barrierDismissible: true,
                                  barrierLabel: '',
                                  context: context,
                                  pageBuilder:
                                      (context, animation1, animation2) {
                                    return const Text("data");
                                  },
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
                                      "PLACE ORDER",
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

  Widget selectOption(String optionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          optionText,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 18,
              ),
        ),
      ],
    );
  }

  Widget title(String title1, String title2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title1,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16,
                color: HexColor("#515C6F"),
              ),
        ),
        Text(
          title2,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16,
                color: Colors.red,
              ),
        ),
      ],
    );
  }

  Widget placeOrder(String image, String brandName, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          height: 130,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          brandName,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16,
              ),
        ),
        Text(
          price,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

enum ChooseOption {
  succsess,
  paymrntError,
  orderNotComplete,
}
