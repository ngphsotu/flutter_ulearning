import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/common/common.dart';

// * SIGNIN PAGE WIDGETS

// * Build Appbar Widget
AppBar buildSignInUpAppBar(String type) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1,
        // height defines he thickness of the line
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

// * Build Third Party Login Widget
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

// * Reusable Icon
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

// * Text - Forgot Password
Widget forgotPassword() {
  return TextButton(
    onPressed: () {
      if (kDebugMode) {
        print('Press Forgot password Text');
      }
    },
    child: ReusableText(
      text: 'Forgot password ?',
      color: AppColors.primaryText,
      fontStyle: FontStyle.italic,
      fontSize: 14.sp,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.primarySecondaryElementText,
    ),
  );
}

// Build Login & Register Button
// Widget buildLogInAndRegButton(String buttonName) {
//   return GestureDetector(
//     onTap: () {},
//     child: Center(
//       child: Container(
//         width: 325.w,
//         height: 50.h,
//         margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(15.w),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(.1),
//               offset: const Offset(0, 1),
//               blurRadius: 2,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Center(child: Text(buttonName)),
//       ),
//     ),
//   );
// }
