// ignore_for_file: unnecessary_new, avoid_function_literals_in_foreach_calls

import 'package:goldsman/Cart/addAddress_screen.dart';
import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Widgets/appbar.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  bool isLoading = false;

  List<Address> lstAddress = [];

  @override
  void initState() {
    super.initState();
    getAddress();
  }

  getAddress() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    for (var i = 0; i < 3; i++) {
      Address objAddress = new Address();
      objAddress.address = i == 0
          ? "Riyadh, Saudi Arabia, 12375 Riyadh 21473"
          : i == 1
              ? "Hail, Saudi Arabia, 12375 Hail 21473"
              : i == 2
                  ? "Khobar, Saudi Arabia, 12375 Khobar 21473"
                  : "";

      objAddress.name = "Majed Shammary";

      objAddress.isSelect = i == 0
          ? false
          : i == 1
              ? true
              : i == 2
                  ? false
                  : false;

      objAddress.id = i == 0
          ? 0
          : i == 1
              ? 1
              : i == 2
                  ? 2
                  : 0;

      lstAddress.add(objAddress);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarUI(
                isBackArrow: true,
                text: "Shipping Address",
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
                padding: const EdgeInsets.only(
                    left: 14, right: 14, top: 14, bottom: 8),
                child: Text(
                  "Shipping Address",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 16,
                        color: HexColor("#515C6F"),
                      ),
                ),
              ),
              Expanded(
                child: !isLoading
                    ? ListView.builder(
                        itemCount: lstAddress.length,
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 14),
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              addressDetail(
                                  lstAddress[i].name,
                                  lstAddress[i].address,
                                  lstAddress[i].isSelect,
                                  lstAddress[i].id),
                              const SizedBox(
                                height: 18,
                              ),
                            ],
                          );
                        },
                      )
                    : ListView(
                        padding:
                            const EdgeInsets.only(top: 14, right: 14, left: 14),
                        children: [
                          for (var i = 0; i < 3; i++)
                            ShimmerWidget(
                              isLoading: isLoading,
                              widget: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                        left: 51,
                                        right: 51),
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
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 14),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 500),
                    child: const AddAddressScreen(
                      isEdit: false,
                    ),
                  ),
                );
              },
              child: Image.asset(
                ConstanceData.addAddress,
                height: 70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addressDetail(String name, String address, bool isSelect, int id) {
    return Container(
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
              : const BoxShadow(color: Colors.transparent),
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
                  name,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 500),
                        child: AddAddressScreen(
                          isEdit: true,
                          address: address,
                          isUseThisAddress: isSelect,
                          name: name,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Edit",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 16, color: HexColor("#515C6F")),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              address,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 16,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                lstAddress.forEach((element) {
                  if (element.id == id) {
                    element.isSelect = true;
                  } else {
                    element.isSelect = false;
                  }
                });
                setState(() {});
              },
              child: Row(
                children: [
                  isSelect
                      ? Icon(
                          Icons.check_box,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(
                          Icons.check_box_outline_blank,
                          color: Theme.of(context).dividerColor,
                        ),
                  const SizedBox(width: 8),
                  Text(
                    "Use as the shipping address",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          color: isSelect
                              ? Theme.of(context).textTheme.bodyText2!.color
                              : HexColor("#515c6f"),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Address {
  String name;
  String address;
  bool isSelect;
  int id;

  Address({
    this.name = '',
    this.address = '',
    this.isSelect = false,
    this.id = 0,
  });
}
