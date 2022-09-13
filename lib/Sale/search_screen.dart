// ignore_for_file: unnecessary_new
import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Sale/sale_screen.dart';
import 'package:goldsman/Widgets/appbar.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchCTRl = new TextEditingController();

  PersonType enumPersonType = PersonType.Men;
  List<MenSearch> lstMenSearch = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    for (var i = 0; i < 5; i++) {
      MenSearch objMenSearch = new MenSearch();
      if (i == 0) {
        objMenSearch.isSelect = true;
      }
      i == 0
          ? objMenSearch.type = "Dresses"
          : i == 1
              ? objMenSearch.type = "Street"
              : i == 2
                  ? objMenSearch.type = "Office dressing"
                  : i == 3
                      ? objMenSearch.type = "Leva shirts"
                      : i == 4
                          ? objMenSearch.type = "Jeans men"
                          : objMenSearch.type = "Jeans men";

      lstMenSearch.add(objMenSearch);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarUI(
              isBackArrow: true,
              text: "Search",
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
              child: !isLoading
                  ? ListView(
                      padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
                      children: [
                        Container(
                          height: 47,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
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
                          child: TextFormField(
                            autofocus: true,
                            controller: searchCTRl,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 10, top: 8),
                              labelText: "Search",
                              border: InputBorder.none,
                              hintStyle: Theme.of(context).textTheme.headline1!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey,
                                  ),
                              labelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey,
                                  ),
                              suffixIcon: const Icon(Icons.search),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            personDetail("Men (34)", PersonType.Men),
                            personDetail("Women (17)", PersonType.Women),
                            personDetail("kids (8)", PersonType.Kids),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Recent Search",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 18,
                                color: HexColor("#b5bbc4"),
                              ),
                        ),
                        const SizedBox(height: 16),
                        for (var i = 0; i < lstMenSearch.length; i++)
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    lstMenSearch[i].isSelect = !lstMenSearch[i].isSelect;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      lstMenSearch[i].type,
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            fontSize: 18,
                                          ),
                                    ),
                                    lstMenSearch[i].isSelect
                                        ? Image.asset(
                                            ConstanceData.Active,
                                            height: 30,
                                          )
                                        : Image.asset(
                                            ConstanceData.Inactive,
                                            height: 30,
                                          ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            recentSearch("Shopes"),
                            recentSearch("Sport wears"),
                            recentSearch("Caps"),
                            recentSearch("Bang and Olufsen"),
                            recentSearch("Jeans"),
                            recentSearch("Apple"),
                            recentSearch("Shoes LA"),
                            recentSearch("Sport wears"),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 24,
                        )
                      ],
                    )
                  : ListView(
                      padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
                      children: [
                        ShimmerWidget(
                          isLoading: isLoading,
                          widget: Container(
                            height: 47,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Theme.of(context).backgroundColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            for (var i = 0; i < 3; i++)
                              Expanded(
                                child: ShimmerWidget(
                                  isLoading: isLoading,
                                  widget: Container(
                                    height: 37,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Recent Search",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 18,
                                color: HexColor("#b5bbc4"),
                              ),
                        ),
                        const SizedBox(height: 16),
                        for (var i = 0; i < 5; i++)
                          Column(
                            children: [
                              ShimmerWidget(
                                isLoading: isLoading,
                                widget: Container(
                                  height: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget recentSearch(String text) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor("#f1f2f3"),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16,
              ),
        ),
      ),
    );
  }

  Widget personDetail(String text, PersonType enumPersonTypes) {
    return InkWell(
      onTap: () {
        setState(() {
          enumPersonType = enumPersonTypes;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: enumPersonTypes == enumPersonType ? Theme.of(context).primaryColor : HexColor("#b5bbc4")),
          color: enumPersonTypes == enumPersonType ? Theme.of(context).primaryColor : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 16,
                  color: enumPersonTypes == enumPersonType ? Colors.white : HexColor("#b5bbc4"),
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}

class MenSearch {
  String type;
  bool isSelect;

  MenSearch({
    this.type = "",
    this.isSelect = false,
  });
}
