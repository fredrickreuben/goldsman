import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Sale/sale_screen.dart';
import 'package:goldsman/Sale/search_screen.dart';
import 'package:goldsman/Widgets/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ItemsCategories extends StatefulWidget {
  const ItemsCategories({Key? key}) : super(key: key);

  @override
  _ItemsCategoriesState createState() => _ItemsCategoriesState();
}

class _ItemsCategoriesState extends State<ItemsCategories> {
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
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              color: Theme.of(context).backgroundColor,
              height: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + 14,
              child: Padding(
                padding: const EdgeInsets.only(top: 14, right: 14, left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            duration: const Duration(milliseconds: 500),
                            child: const SizedBox(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    Text(
                      "Main Home",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 24,
                          ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            duration: const Duration(milliseconds: 500),
                            child: const SearchScreen(),
                          ),
                        );
                      },
                      child: Image.asset(
                        ConstanceData.search,
                        height: 20,
                        color: AppTheme.isLightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: [
                  AppTheme.isLightTheme
                      ? BoxShadow(
                          color: Colors.grey.withOpacity(0.07),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 8),
                        )
                      : const BoxShadow(
                          color: Colors.transparent,
                        ),
                ],
              ),
              child: TabBar(
                tabs: [
                  tabTitle("Men"),
                  tabTitle("Women"),
                  tabTitle("Kids"),
                ],
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Theme.of(context).textTheme.bodyText2!.color,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  tabs(ConstanceData.mencollection),
                  tabs(ConstanceData.womencollection),
                  tabs(ConstanceData.kidcollection),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabs(String image) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeftWithFade,
            duration: const Duration(milliseconds: 500),
            child: const SaleScreen(),
          ),
        );
      },
      child: ListView(
        padding: const EdgeInsets.only(right: 14, left: 14, top: 16),
        children: [
          !isLoading
              ? Image.asset(
                  image,
                  fit: BoxFit.contain,
                )
              : loadingWidget(159),
          const SizedBox(height: 12),
          !isLoading
              ? Image.asset(
                  ConstanceData.collection1,
                  fit: BoxFit.contain,
                )
              : loadingWidget(96),
          const SizedBox(height: 12),
          !isLoading
              ? Image.asset(
                  ConstanceData.collection2,
                  fit: BoxFit.contain,
                )
              : loadingWidget(96),
          const SizedBox(height: 12),
          !isLoading
              ? Image.asset(
                  ConstanceData.collection3,
                  fit: BoxFit.contain,
                )
              : loadingWidget(96),
          const SizedBox(height: 12),
          !isLoading
              ? Image.asset(
                  ConstanceData.collection4,
                  fit: BoxFit.contain,
                )
              : loadingWidget(96),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 24),
        ],
      ),
    );
  }

  Widget loadingWidget(double height) {
    return ShimmerWidget(
      isLoading: isLoading,
      widget: Container(
        height: height,
        padding: const EdgeInsets.only(left: 51, right: 51),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget tabTitle(String title) {
    return Tab(
      icon: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
