// ignore_for_file: unnecessary_new, unnecessary_null_comparison

import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Widgets/appbar.dart';
import 'package:goldsman/Widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({Key? key}) : super(key: key);

  @override
  _BrandScreenState createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  TextEditingController searchCtrl = new TextEditingController();

  List<Brand> lstBrand = [];
  List<Brand> lstSearchBrand = [];
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    getBrand();
  }

  getBrand() {
    for (var i = 0; i < 8; i++) {
      Brand objBrand = Brand();
      objBrand.brandName = i == 0
          ? "Adidas"
          : i == 1
              ? "Nike"
              : i == 2
                  ? "New Balance"
                  : i == 3
                      ? "Puma"
                      : i == 4
                          ? "Under Armour"
                          : i == 5
                              ? "Fila"
                              : i == 6
                                  ? "Umbro"
                                  : i == 7
                                      ? "Reebok"
                                      : "";

      objBrand.image = i == 0
          ? ConstanceData.image10
          : i == 1
              ? ConstanceData.image12
              : i == 2
                  ? ConstanceData.image9
                  : i == 3
                      ? ConstanceData.image11
                      : i == 4
                          ? ConstanceData.image13
                          : i == 5
                              ? ConstanceData.image14
                              : i == 6
                                  ? ConstanceData.image15
                                  : i == 7
                                      ? ConstanceData.image16
                                      : "";
      objBrand.isSelected = i == 0 ? true : false;
      lstBrand.add(objBrand);
    }
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
            text: "Brand",
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
            padding: const EdgeInsets.only(right: 14, left: 14, top: 16),
            child: Container(
              height: 48,
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
                      : BoxShadow(
                          color: Colors.transparent.withOpacity(0.07),
                        ),
                ],
              ),
              child: TextFormField(
                controller: searchCtrl,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20, top: 12),
                  hintText: "Search for brand",
                  border: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                      ),
                  labelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                      ),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                ),
                onChanged: (text) {
                  if (text != null && text != "") {
                    searchText(text);
                  } else {
                    setState(() {
                      isSearch = false;
                    });
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                ListView(
                  padding: EdgeInsets.only(right: 14, left: 14, top: 24, bottom: MediaQuery.of(context).padding.bottom + 80),
                  children: [
                    if (isSearch)
                      for (var i = 0; i < lstSearchBrand.length; i++)
                        brands(
                          lstSearchBrand[i].image,
                          lstSearchBrand[i].brandName,
                          lstSearchBrand[i].isSelected,
                          i,
                        ),
                    if (!isSearch)
                      for (var i = 0; i < lstBrand.length; i++)
                        brands(
                          lstBrand[i].image,
                          lstBrand[i].brandName,
                          lstBrand[i].isSelected,
                          i,
                        ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 14, left: 14, bottom: MediaQuery.of(context).padding.bottom + 24),
                  child: ButtonWidget(
                    text: "APPLY FILTER",
                    ontap: () {
                      Navigator.pop(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                          child: const SizedBox(),
                        ),
                      );
                      Navigator.pop(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 500),
                          child: const SizedBox(),
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

  searchText(String text) {
    lstSearchBrand.clear();
    for (var element in lstBrand) {
      if (element.brandName.toLowerCase().contains(text.toLowerCase())) {
        lstSearchBrand.add(element);
      }
    }
    setState(() {
      isSearch = true;
    });
  }

  Widget brands(String image, String name, bool isSelect, int number) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (!isSearch) {
              lstBrand[number].isSelected = !lstBrand[number].isSelected;
            } else {
              lstSearchBrand[number].isSelected = !lstSearchBrand[number].isSelected;
            }
            setState(() {});
          },
          child: Row(
            children: [
              Image.asset(
                image,
                width: 35,
                color: AppTheme.isLightTheme ? Colors.black : Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 18,
                      color: lstBrand[number].isSelected ? Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyText2!.color,
                      fontWeight: lstBrand[number].isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
              ),
              const Expanded(child: SizedBox()),
              Checkbox(
                value: isSelect,
                onChanged: (val) {
                  if (!isSearch) {
                    lstBrand[number].isSelected = val!;
                  } else {
                    lstSearchBrand[number].isSelected = val!;
                  }
                  setState(() {});
                },
                activeColor: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
        const Divider(
          endIndent: 40,
          indent: 40,
        ),
      ],
    );
  }
}

class Brand {
  String brandName;
  String image;
  bool isSelected;

  Brand({
    this.brandName = "",
    this.image = "",
    this.isSelected = false,
  });
}
