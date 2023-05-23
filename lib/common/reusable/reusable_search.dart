import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common.dart';

// * Reusable Search
class ReusableSearch extends StatefulWidget {
  final int? maxLine;
  final bool autocorrect;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String value)? onChanged;

  const ReusableSearch({
    super.key,
    this.maxLine = 1,
    this.hintText,
    this.labelText,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.autocorrect = true,
    this.onChanged,
  });

  @override
  State<ReusableSearch> createState() => _ReusableSearchState();
}

class _ReusableSearchState extends State<ReusableSearch> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine,
      // onChanged: (value) => widget.onChanged!(value),
      autocorrect: widget.autocorrect,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        labelStyle: TextStyle(
          color: AppColors.primaryText,
          fontSize: 14.sp,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
        ),
        hintStyle: TextStyle(
          color: AppColors.primarySecondaryElementText,
          fontSize: 12.sp,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.w),
          borderSide:
              const BorderSide(color: AppColors.primaryThirdElementText),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w),
          borderSide:
              const BorderSide(color: AppColors.primaryThirdElementText),
        ),
        // border: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        // ),
        // disabledBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        // ),
      ),
    );
  }
}
