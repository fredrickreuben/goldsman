import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:goldsman/Widgets/backArrow.dart';
import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
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
            height: MediaQuery.of(context).padding.top + AppBar().preferredSize.height + 14,
            child: Padding(
              padding: const EdgeInsets.only(top: 14, right: 14, left: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackArrow(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Track Order",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 24,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      children: [
                        Image.asset(ConstanceData.Messages, height: 35),
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset(ConstanceData.Notification, height: 35),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14, left: 2, top: 14),
            child: Row(
              children: [
                Hero(
                  tag: "ConstanceData.noti3",
                  child: Image.asset(ConstanceData.noti3, width: 70),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Package from your order ',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 14,
                                color: HexColor("#727C8E"),
                              ),
                        ),
                        TextSpan(
                          text: '#1196205 ',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: HexColor("#65dacc"),
                              ),
                        ),
                        TextSpan(
                          text: 'has arrived to destination country',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 14,
                                color: HexColor("#727C8E"),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 24, left: 18, right: 14, top: 14),
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).dividerColor,
                      radius: 18,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).backgroundColor,
                        radius: 16,
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 8,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    trackTime("20/20", "10:00 AM"),
                    const SizedBox(
                      width: 40,
                    ),
                    orderStatus("Order Signed", "China, Hong Kong")
                  ],
                ),
                progressLine(),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).dividerColor,
                      radius: 18,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).backgroundColor,
                        radius: 16,
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 8,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    trackTime("20/20", "17:30 PM"),
                    const SizedBox(
                      width: 40,
                    ),
                    orderStatus("Order Processed", "Customs, Hong Kong")
                  ],
                ),
                progressLine(),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 18,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).backgroundColor,
                        radius: 16,
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 8,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    trackTime("20/20", "07:21 AM"),
                    const SizedBox(
                      width: 40,
                    ),
                    orderStatus("Shipped", "Kingdom SA, Customs")
                  ],
                ),
                progressLine(isProgressDone: false),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).dividerColor,
                      radius: 18,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).backgroundColor,
                        radius: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    orderStatus("Out for delivery", "Riaydh, Saudi Arabia")
                  ],
                ),
                progressLine(isProgressDone: false),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).dividerColor,
                      radius: 18,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).backgroundColor,
                        radius: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    orderStatus("Delivered", "Home")
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget orderStatus(String status, String place) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          status,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 20,
                color: AppTheme.isLightTheme ? HexColor("#515C6F") : Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          place,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16,
                color: HexColor("#515C6F"),
              ),
        ),
      ],
    );
  }

  Widget trackTime(String date, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 16,
                color: HexColor("#515C6F"),
              ),
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 12,
                color: HexColor("#515C6F"),
              ),
        ),
      ],
    );
  }

  Widget progressLine({bool isProgressDone = true}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17),
          child: Container(
            height: 70,
            width: 2,
            color: isProgressDone ? Theme.of(context).primaryColor : Theme.of(context).dividerColor,
          ),
        ),
      ],
    );
  }
}
