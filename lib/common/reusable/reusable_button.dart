// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// * Reusable Button
class ReusableButton extends StatefulWidget {
  final String buttonName;
  final Color? textColor;
  final Color? backgroundColor;
  final BorderSide? side;
  final Function() onPressed;

  const ReusableButton({
    super.key,
    this.side,
    this.textColor,
    this.backgroundColor,
    required this.onPressed,
    required this.buttonName,
  });

  @override
  State<ReusableButton> createState() => _ReusableButtonState();
}

class _ReusableButtonState extends State<ReusableButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: widget.side,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 0,
        backgroundColor: widget.backgroundColor,
      ),
      onPressed: widget.onPressed,
      child: Center(
        child: Text(
          widget.buttonName,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 18.sp,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
