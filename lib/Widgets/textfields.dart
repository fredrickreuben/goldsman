import 'package:goldsman/Constance/constance.dart';
import 'package:goldsman/Constance/theme.dart';
import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  final bool isPrefix;
  final bool isAutofocus;
  final String hinttext;
  final String labletext;
  final TextInputType textinputType;
  final TextEditingController? ctrl;
  final bool isSuffix;
  final double radius;

  const TextFields({
    Key? key,
    this.isPrefix = false,
    required this.hinttext,
    required this.labletext,
    this.isAutofocus = false,
    required this.textinputType,
    this.ctrl,
    this.isSuffix = false,
    this.radius = 13,
  }) : super(key: key);

  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
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
        autofocus: widget.isAutofocus ? true : false,
        keyboardType: widget.textinputType,
        controller: widget.ctrl,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10, top: 12),
          hintText: widget.hinttext,
          labelText: widget.labletext,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(widget.radius)
          ),
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
          suffixIcon: widget.isSuffix
              ? Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Image.asset(
                    ConstanceData.payment3,
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
