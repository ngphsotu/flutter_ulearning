import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/common/common.dart';

// * HOME PAGE WIDGETS

// * Build Home Page Appbar Widget
AppBar buildHomeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/person.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// * Build Home Page Text Widget
Widget buildHomePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

// * Build Search View
Widget buildSearchView() {
  return Row(
    children: [
      SizedBox(
        width: 280.w,
        height: 40.h,
        child: const ReusableSearch(
          hintText: 'Search your course',
          labelText: 'Search',
          prefixIcon: Icon(Icons.search, color: Colors.black),
          autocorrect: false,
          keyboardType: TextInputType.multiline,
        ),
      ),
      GestureDetector(
        onTap: () {
          if (kDebugMode) {
            print('Tap Settings Search Icon');
          }
        },
        child: Container(
          width: 40.h,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            border: Border.all(color: AppColors.primaryElement),
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      ),
    ],
  );
}
