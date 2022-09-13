import 'package:goldsman/Constance/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatefulWidget {
  final bool isLoading;
  final Widget widget;
  const ShimmerWidget({Key? key, required this.isLoading, required this.widget}) : super(key: key);

  @override
  _ShimmerWidgetState createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.isLightTheme ? Colors.grey[200]! : Theme.of(context).backgroundColor,
      highlightColor: AppTheme.isLightTheme ? Colors.grey[300]! : Theme.of(context).backgroundColor.withOpacity(0.2),
      direction: ShimmerDirection.ltr,
      enabled: widget.isLoading,
      child: widget.widget,
    );
  }
}
