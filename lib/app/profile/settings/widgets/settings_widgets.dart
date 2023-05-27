import 'package:flutter/foundation.dart';
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

// * Build Settings Button Widget in Settings Page
Widget settingsButton(context, Function()? function) {
  return GestureDetector(
    onTap: () {
      if (kDebugMode) {
        print('Tapped Logout');
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const ReusableText(text: 'Confirm logout'),
            content: const ReusableText(text: 'Are you sure ?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (kDebugMode) {
                    print('Pressed Cancel Logout Text Button');
                  }
                },
                child: const ReusableText(text: 'Cancel'),
              ),
              TextButton(
                onPressed: function,
                child: const ReusableText(text: 'Confirm'),
              ),
            ],
          );
        },
      );
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/icons/logout.png'),
        ),
      ),
    ),
  );
}
