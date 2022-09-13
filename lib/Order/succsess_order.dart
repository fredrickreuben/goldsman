// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Order/myOrder_screen.dart';
import 'package:goldsman/Order/placeOrder_screen.dart';
import 'package:goldsman/Widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SuccsessOrderScreen extends StatefulWidget {
  final ChooseOption enumChooseOption;
  const SuccsessOrderScreen({Key? key, required this.enumChooseOption}) : super(key: key);

  @override
  _SuccsessOrderScreenState createState() => _SuccsessOrderScreenState();
}

class _SuccsessOrderScreenState extends State<SuccsessOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 14, left: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.enumChooseOption == ChooseOption.succsess
                    ? ConstanceData.succsess
                    : widget.enumChooseOption == ChooseOption.paymrntError
                        ? ConstanceData.paymentcheck
                        : ConstanceData.ordererror,
                height: 120,
              ),
              Text(
                widget.enumChooseOption == ChooseOption.succsess
                    ? "Ordered Successfully!"
                    : widget.enumChooseOption == ChooseOption.paymrntError
                        ? "Please check another\npayment!"
                        : "Order not complete!",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.enumChooseOption == ChooseOption.succsess
                    ? "Your order will be delivered soon. Thank you for choosing our app!"
                    : widget.enumChooseOption == ChooseOption.paymrntError
                        ? "Please make sure you’re using a vaild credit card"
                        : "Something went wrong, please check and re-try again later",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 20,
                      color: HexColor("#727C8E"),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              ButtonWidget(
                text: widget.enumChooseOption == ChooseOption.succsess
                    ? "MY ORDERS"
                    : widget.enumChooseOption == ChooseOption.paymrntError
                        ? "Try agian"
                        : "Back to Home",
                ontap: () {
                  if (widget.enumChooseOption == ChooseOption.succsess) {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 500),
                        child: const MyOrderScreen(),
                      ),
                    );
                  } else if (widget.enumChooseOption == ChooseOption.paymrntError) {
                    Navigator.pop(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 500),
                        child: const SizedBox(),
                      ),
                    );
                  } else {
                    for (var i = 0; i < 2; i++)
                      Navigator.pop(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                          child: const SizedBox(),
                        ),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
