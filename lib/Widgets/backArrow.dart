// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(left: 8),
        width: 30,
        height: 30,
        child: const Icon(Icons.arrow_back_ios),
      ),
      onTap: () {
        Navigator.pop(
          context,
          PageTransition(
            type: PageTransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 100),
            child: const SizedBox(),
          ),
        );
      },
    );
  }
}
