// ignore_for_file: unnecessary_new, unnecessary_null_comparison

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Widgets/backArrow.dart';
import 'package:goldsman/Widgets/buttons.dart';
import 'package:goldsman/Widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:goldsman/Constance/constance.dart' as constance;

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController cardNumberCtrl = new TextEditingController();
  TextEditingController dateCtrl = new TextEditingController();
  TextEditingController cvvCtrl = new TextEditingController();

  bool isDefaultPayment = true;

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
              height: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + 14,
              child: Padding(
                padding: const EdgeInsets.only(top: 14, right: 14, left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackArrow(),
                    Text(
                      "Add New Card",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 24,
                          ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ConstanceData.delete,
                          height: 20,
                          color: AppTheme.isLightTheme ? Theme.of(context).textTheme.bodyText2!.color : Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 8),
              child: Row(
                children: [
                  Text(
                    "Add Credit card",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          color: HexColor("#515C6F"),
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(left: 14, right: 14),
                children: [
                  TextFields(
                    hinttext: "Name",
                    labletext: "Name on card",
                    isPrefix: false,
                    isAutofocus: true,
                    textinputType: TextInputType.text,
                    ctrl: nameCtrl,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFields(
                    hinttext: "number",
                    labletext: "Card number",
                    isPrefix: false,
                    isAutofocus: true,
                    textinputType: TextInputType.text,
                    ctrl: cardNumberCtrl,
                    isSuffix: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFields(
                    hinttext: "Expire Date",
                    labletext: "00/00",
                    isPrefix: false,
                    isAutofocus: true,
                    textinputType: TextInputType.datetime,
                    ctrl: dateCtrl,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFields(
                    hinttext: "000",
                    labletext: "CVV",
                    isPrefix: false,
                    isAutofocus: true,
                    textinputType: TextInputType.datetime,
                    ctrl: cvvCtrl,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isDefaultPayment = !isDefaultPayment;
                      });
                    },
                    child: Row(
                      children: [
                        Checkbox(
                          value: isDefaultPayment,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (val) {
                            setState(() {
                              isDefaultPayment = val!;
                            });
                          },
                        ),
                        Text(
                          "Set as default payment method",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 16,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ButtonWidget(
                    text: "ADD NEW CARD",
                    ontap: () async {
                      if (nameCtrl.text == null || nameCtrl.text == "") {
                        constance.openSnackBar(context, "Please Enter Name", SnackBarTye.error, isVibrate: true);
                        return;
                      }
                      if (cardNumberCtrl.text == null || cardNumberCtrl.text == "") {
                        constance.openSnackBar(context, "Please Enter Card Number", SnackBarTye.error, isVibrate: true);
                        return;
                      }
                      if (dateCtrl.text == null || dateCtrl.text == "") {
                        constance.openSnackBar(context, "Please Enter Date", SnackBarTye.error, isVibrate: true);
                        return;
                      }
                      if (cvvCtrl.text == null || cvvCtrl.text == "") {
                        constance.openSnackBar(context, "Please Enter CVV", SnackBarTye.error, isVibrate: true);
                        return;
                      }
                      constance.openSnackBar(context, "Card Added Succsessfully", SnackBarTye.succsess, isVibrate: true);
                      await Future.delayed(const Duration(milliseconds: 1000));
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
