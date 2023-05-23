import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../value/value.dart';

// * Reusable Text
class ReusableText extends StatefulWidget {
  final String text;
  final Color? color;
  final FontStyle? fontStyle;
  final Color? decorationColor;
  final TextDecoration? decoration;

  const ReusableText({
    super.key,
    required this.text,
    this.color = AppColors.primarySecondaryElementText,
    this.fontStyle,
    this.decoration,
    this.decorationColor,
  });

  @override
  State<ReusableText> createState() => _ReusableTextState();
}

class _ReusableTextState extends State<ReusableText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.color,
        fontSize: 14.sp,
        fontStyle: widget.fontStyle,
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal,
        decoration: widget.decoration,
        decorationColor: widget.decorationColor,
      ),
    );
  }
}
