import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Filter/brand_screen.dart';
import 'package:goldsman/Widgets/appbar.dart';
import 'package:goldsman/Widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Size> lstSize = [];
  List<ColorsStyle> lstColorsStyle = [];

  @override
  void initState() {
    super.initState();
    getSizeColor();
  }

  getSizeColor() {
    for (var i = 0; i < 4; i++) {
      Size objSize = Size();
      objSize.name = i == 0
          ? "XS"
          : i == 1
              ? "S"
              : i == 2
                  ? "M"
                  : "L";
      objSize.isSelected = i == 0 ? true : false;
      lstSize.add(objSize);
    }

    for (var i = 0; i < 9; i++) {
      ColorsStyle objColorsStyle = ColorsStyle();
      objColorsStyle.name = i == 0
          ? ConstanceData.black
          : i == 1
              ? ConstanceData.grey
              : i == 2
                  ? ConstanceData.pink
                  : i == 3
                      ? ConstanceData.purple
                      : i == 4
                          ? ConstanceData.yellow
                          : i == 5
                              ? ConstanceData.orange
                              : i == 6
                                  ? ConstanceData.blue
                                  : i == 7
                                      ? ConstanceData.green
                                      : i == 8
                                          ? ConstanceData.lightPink
                                          : ConstanceData.lightPink;
      objColorsStyle.isSelected = i == 0 ? true : false;
      lstColorsStyle.add(objColorsStyle);
    }
    setState(() {});
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
            text: "Filters",
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
              padding: const EdgeInsets.only(right: 14, left: 14, top: 24),
              children: [
                filterTitle("SELECT SIZE"),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var i = 0; i < lstSize.length; i++)
                      InkWell(
                        onTap: () {
                          for (var element in lstSize) {
                            element.isSelected = false;
                          }
                          lstSize[i].isSelected = true;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: lstSize[i].isSelected ? Theme.of(context).primaryColor : Colors.transparent,
                            ),
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              !lstSize[i].isSelected
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
                            padding: const EdgeInsets.only(right: 28, left: 28, top: 10, bottom: 10),
                            child: Text(
                              lstSize[i].name,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 16,
                                    color: lstSize[i].isSelected ? Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyText2!.color,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                filterTitle("SELECT COLOR"),
                const SizedBox(
                  height: 16,
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (var i = 0; i < lstColorsStyle.length; i++)
                      InkWell(
                        onTap: () {
                          for (var element in lstColorsStyle) {
                            element.isSelected = false;
                          }
                          lstColorsStyle[i].isSelected = true;
                          setState(() {});
                        },
                        child: colorStyles(lstColorsStyle[i].name, lstColorsStyle[i].isSelected),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                filterTitle("PRICE RANGE"),
                const SizedBox(
                  height: 8,
                ),
                RangeSlider(
                  values: _currentRangeValues,
                  max: 100,
                  divisions: 5,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                filterTitle("SELECT BRAND"),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.07),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
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
                          items: <String>['Adidas', 'Nike', 'Puma', 'Fila', 'Umbro', 'Reebok'].map<DropdownMenuItem<String>>((String value) {
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
                const SizedBox(
                  height: 24,
                ),
                filterTitle("SELECT CATEGORY"),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.07),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: dropdownValueSelectCate,
                          icon: const SizedBox(),
                          elevation: 20,
                          underline: const SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueSelectCate = newValue!;
                            });
                          },
                          items: <String>['Clothings', 'Shose', 'Wearing'].map<DropdownMenuItem<String>>((String value) {
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
                const SizedBox(
                  height: 24,
                ),
                filterTitle("SORT BY"),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.07),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButton<String>(
                          value: dropdownValueSort,
                          icon: const SizedBox(),
                          elevation: 20,
                          underline: const SizedBox(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueSort = newValue!;
                            });
                          },
                          items: <String>['Latest', 'Oldest', 'Medium'].map<DropdownMenuItem<String>>((String value) {
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
                const SizedBox(
                  height: 24,
                ),
                ButtonWidget(
                  text: "APPLY FILTER",
                  ontap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 500),
                        child: const BrandScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 32,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  RangeValues _currentRangeValues = const RangeValues(20, 80);

  String dropdownValue = 'Adidas';
  String dropdownValueSelectCate = 'Clothings';
  String dropdownValueSort = 'Latest';

  Widget colorStyles(String image, bool isSelect) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(
          image,
          height: 40,
        ),
        isSelect
            ? const Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(
                  Icons.check,
                  size: 20,
                  color: Colors.white,
                ),
              )
            : const SizedBox()
      ],
    );
  }

  Widget filterTitle(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: 14,
            color: HexColor("#515C6F"),
          ),
    );
  }
}

class ColorsStyle {
  String name;
  bool isSelected;

  ColorsStyle({
    this.name = "",
    this.isSelected = false,
  });
}

class Size {
  String name;
  bool isSelected;

  Size({
    this.name = "",
    this.isSelected = false,
  });
}
