// ignore_for_file: unnecessary_new, unnecessary_null_comparison, file_names

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Widgets/appbar.dart';
import 'package:goldsman/Widgets/buttons.dart';
import 'package:goldsman/Widgets/textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:goldsman/Constance/constance.dart' as constance;

class AddAddressScreen extends StatefulWidget {
  final String? name;
  final String? address;
  final bool isUseThisAddress;
  final bool isEdit;
  const AddAddressScreen({Key? key, this.name, this.address, this.isUseThisAddress = false, required this.isEdit}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController addressCtrl = new TextEditingController();

  bool isUsethisAddress = false;

  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() {
    if (widget.isEdit) {
      nameCtrl.text = widget.name!;
      addressCtrl.text = widget.address!;
      isUsethisAddress = widget.isUseThisAddress;
      setState(() {});
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarUI(
              isBackArrow: true,
              text: widget.isEdit ? "Edit Address" : "Add New Address",
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
              child: ListView(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 16),
                children: [
                  TextFields(
                    hinttext: "Name",
                    labletext: "Your Name",
                    isPrefix: false,
                    isAutofocus: true,
                    textinputType: TextInputType.text,
                    ctrl: nameCtrl,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFields(
                    hinttext: "Full Address",
                    labletext: "Full Address",
                    isPrefix: false,
                    textinputType: TextInputType.text,
                    ctrl: addressCtrl,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Use as the shipping address",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 16,
                              color: HexColor("#515c6f"),
                            ),
                      ),
                      CupertinoSwitch(
                        value: isUsethisAddress,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (state) {
                          setState(() {
                            isUsethisAddress = state;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ButtonWidget(
                    text: "Add New Address",
                    ontap: () async {
                      if (nameCtrl.text == null || nameCtrl.text == "") {
                        constance.openSnackBar(context, "Please Enter Name", SnackBarTye.error, isVibrate: true);
                      } else if (addressCtrl.text != null && addressCtrl.text.length < 3) {
                        constance.openSnackBar(context, "Please Enter Address", SnackBarTye.error, isVibrate: true);
                      } else {
                        FocusScope.of(context).requestFocus(FocusNode());
                        constance.openSnackBar(context, "Address Add Succsessfully.", SnackBarTye.succsess, isVibrate: true);
                        await Future.delayed(const Duration(seconds: 1));
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
            )
          ],
        ),
      ),
    );
  }
}
