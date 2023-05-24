import 'package:flutter/material.dart';

import '../common.dart';

// * Build Reusable Text
class ReusableText extends StatefulWidget {
  final int? maxLines;
  final bool? softWrap;
  final Color? color;
  final Color? decorationColor;
  final String text;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  const ReusableText({
    super.key,
    required this.text,
    this.color = AppColors.primarySecondaryElementText,
    this.maxLines = 1,
    this.fontSize,
    this.overflow,
    this.softWrap,
    this.fontStyle,
    this.textAlign,
    this.fontFamily = 'Avenir',
    this.fontWeight,
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
      maxLines: widget.maxLines,
      overflow: widget.overflow,
      softWrap: widget.softWrap,
      textAlign: widget.textAlign,
      style: TextStyle(
        color: widget.color,
        fontSize: widget.fontSize,
        fontFamily: widget.fontFamily,
        fontWeight: widget.fontWeight,
        decoration: widget.decoration,
        decorationColor: widget.decorationColor,
      ),
    );
  }
}
