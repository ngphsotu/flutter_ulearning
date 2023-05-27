import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/common/common.dart';

// * SIGNIN PAGE WIDGETS

// * Build Appbar Widget in SignIn Page
AppBar buildAppBar(String type) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1,
        // height defines the thickness of the line
      ),
    ),
    title: Text(
      type,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

// * Build Third Party Login Widget in SignIn Page
// Need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 75.w, right: 75.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons(() {
          if (kDebugMode) {
            print('Press Google Icon');
          }
        }, 'google'),
        _reusableIcons(() {
          if (kDebugMode) {
            print('Press Apple Icon');
          }
        }, 'apple'),
        _reusableIcons(() {
          if (kDebugMode) {
            print('Press Facebook Icon');
          }
        }, 'facebook'),
      ],
    ),
  );
}

// * Build Reusable Icon in SignIn Page
Widget _reusableIcons(Function() onTap, String iconName) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

// * Build Text - Forgot Password in SignIn Page
Widget forgotPassword() {
  return GestureDetector(
    onTap: () {
      if (kDebugMode) {
        print('Tap Forgot password Text');
      }
    },
    child: ReusableText(
      text: 'Forgot password ?',
      color: AppColors.primarySecondaryElementText,
      fontSize: 12.sp,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.primarySecondaryElementText,
    ),
  );
}
