import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/common/common.dart';

// * BUILD SETTINGS WIDGETS

// * Build AppBar in Settings Page
AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Container(
        child: ReusableText(
          text: 'Settings',
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
