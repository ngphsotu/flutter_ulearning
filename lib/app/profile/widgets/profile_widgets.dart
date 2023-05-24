import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/common/common.dart';

// * PROFILE PAGE WIDGETS

// * Build AppBar Widget in Profile Page
AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 25.w,
            height: 25.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          ReusableText(
            text: 'Profile',
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            width: 25.w,
            height: 25.h,
            child: Image.asset('assets/icons/more-vertical.png'),
          ),
        ],
      ),
    ),
  );
}

// * Build Prolife Icon & Edit Button Widget in Profile Page
Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    padding: EdgeInsets.only(right: 6.w),
    alignment: Alignment.bottomRight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage('assets/icons/headpic.png'),
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage('assets/icons/edit_3.png'),
    ),
  );
}

// * Build List View Widget in Profile Page
// Settings Sections Buttons

// * Build Info Image in Profile Page
var imagesInfo = <String, String>{
  'Settings': 'settings.png',
  'Payment details': 'credit-card.png',
  'Achievement': 'award.png',
  'Love': 'heart_1.png',
  'Reminders': 'cube.png',
};

Widget buildListView() {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                      color: AppColors.primaryElement,
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Image.asset(
                      'assets/icons/${imagesInfo.values.elementAt(index)}'),
                ),
                SizedBox(width: 15.w),
                ReusableText(
                  text: imagesInfo.keys.elementAt(index),
                  color: AppColors.primaryText,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
