import 'package:goldsman/Constance/theme.dart';
import 'package:flutter/material.dart';

class AppBarUI extends StatefulWidget {
  final String? text;
  final bool isBackArrow;
  final VoidCallback? ontap;

  const AppBarUI({Key? key, this.text, required this.isBackArrow, this.ontap}) : super(key: key);

  @override
  _AppBarUIState createState() => _AppBarUIState();
}

class _AppBarUIState extends State<AppBarUI> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            widget.isBackArrow
                ? InkWell(
                    onTap: () {
                      widget.ontap!();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  )
                : const SizedBox(),
            Text(
              widget.text!,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 24,
                  ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
