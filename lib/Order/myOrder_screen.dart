// ignore_for_file: unnecessary_new, file_names

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyOrderScreen extends StatefulWidget {
  final String? orderType;
  const MyOrderScreen({Key? key, this.orderType}) : super(key: key);

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  bool isLoading = false;
  String ordertype = "All";

  List<OrderStatus> lstOrderStatus = [];

  @override
  void initState() {
    super.initState();
    getorders();
  }

  getorders() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 800));
    if (widget.orderType != null && widget.orderType != "") {
      ordertype = widget.orderType!;
    }
    for (var i = 0; i < 4; i++) {
      OrderStatus objOrderStatus = new OrderStatus();

      objOrderStatus.isSelect = i == 0 ? true : false;
      objOrderStatus.id = i;

      objOrderStatus.orderType = i == 0
          ? "All"
          : i == 1
              ? "In Transit"
              : i == 2
                  ? "Delivered"
                  : i == 3
                      ? "Cancelled"
                      : "";

      lstOrderStatus.add(objOrderStatus);

      if (widget.orderType != null && widget.orderType != "") {
        for (var element in lstOrderStatus) {
          if (widget.orderType == element.orderType) {
            element.isSelect = true;
          } else {
            element.isSelect = false;
          }
        }
      }
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
            height: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + 80,
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + AppBar().preferredSize.height / 2, right: 14, left: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRightWithFade,
                              duration: const Duration(milliseconds: 100),
                              child: const SizedBox(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                      Text(
                        "My Orders",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 24,
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    height: 50,
                    child: !isLoading
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: lstOrderStatus.length,
                            itemBuilder: (context, i) {
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      for (var element in lstOrderStatus) {
                                        element.isSelect = false;
                                      }
                                      lstOrderStatus[i].isSelect = true;
                                      ordertype = lstOrderStatus[i].orderType;

                                      await Future.delayed(const Duration(milliseconds: 800));
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: lstOrderStatus[i].isSelect ? HexColor("#ffba49") : Theme.of(context).backgroundColor,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: lstOrderStatus[i].isSelect ? Colors.transparent : HexColor("#727c8e"),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 8, top: 8, left: 20, right: 20),
                                        child: Text(
                                          lstOrderStatus[i].orderType,
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                fontSize: 18,
                                                color: lstOrderStatus[i].isSelect ? Colors.white : HexColor("#727c8e"),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                ],
                              );
                            },
                          )
                        : ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0; i < 4; i++)
                                ShimmerWidget(
                                  isLoading: isLoading,
                                  widget: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 51, right: 51),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
          /*Expanded(
            child: !isLoading
                ? ListView(
                    padding: const EdgeInsets.only(right: 14, left: 14, top: 14),
                    children: [
                      ordertype == "All" || ordertype == "In Transit"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                orderDate("SEP 27, 2020"),
                                const SizedBox(height: 8),
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        orderDetail("No. 1196205", "SAR 400", "IN TRANSIT"),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                image(ConstanceData.myorder1),
                                                const SizedBox(width: 4),
                                                image(ConstanceData.myorder2),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              children: [
                                                image(ConstanceData.myorder3),
                                                const SizedBox(width: 4),
                                                image(ConstanceData.myorder4),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      ordertype == "All" || ordertype == "Delivered"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                orderDate("FEB 02, 2020"),
                                const SizedBox(height: 8),
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        orderDetail("No. 1055181", "SAR 562.64", "DELIVERED"),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                image(ConstanceData.myorder7),
                                                const SizedBox(width: 4),
                                                image(ConstanceData.myorder6),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: 40,
                                                ),
                                                image(ConstanceData.myorder5),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      ordertype == "All" || ordertype == "Delivered"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                orderDate("FEB 02, 2020"),
                                const SizedBox(height: 8),
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        orderDetail("No. 1127161", "SAR 203.33", "DELIVERED"),
                                        Column(
                                          children: [
                                            image(ConstanceData.myorder8),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          : const SizedBox(),
                      ordertype == "All" || ordertype == "Cancelled"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                orderDate("Aug 27, 2021"),
                                const SizedBox(height: 8),
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        orderDetail("No. 1196500", "SAR 250", "Cancelled"),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                image(ConstanceData.myorder2),
                                                const SizedBox(width: 4),
                                                image(ConstanceData.myorder6),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Row(
                                              children: [
                                                image(ConstanceData.myorder1),
                                                const SizedBox(width: 4),
                                                image(ConstanceData.myorder3),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 40,
                      ),
                    ],
                  )
                : ListView(
                    padding: const EdgeInsets.only(right: 14, left: 14, top: 14),
                    children: [
                      ShimmerWidget(
                        isLoading: isLoading,
                        widget: Column(
                          children: [
                            for (var i = 0; i < 4; i++)
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 16,
                                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 51, right: 51),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 112,
                                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 51, right: 51),
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom + 40,
                      ),
                    ],
                  ),
          )*/
        ],
      ),
    );
  }

  Widget image(String image) {
    return Image.asset(
      image,
      height: 40,
    );
  }

  Widget orderDetail(String orderNo, String price, String orderStatus) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          orderNo,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          price,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16,
              ),
        ),
        const SizedBox(
          height: 8,
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
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 4, top: 4, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      orderStatus,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 14,
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
    );
  }

  Widget orderDate(String date) {
    return Text(
      date,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: 16,
            color: HexColor("#727c8e"),
          ),
    );
  }
}

class OrderStatus {
  int id;
  String orderType;
  bool isSelect;

  OrderStatus({
    this.id = 0,
    this.orderType = "",
    this.isSelect = false,
  });
}
