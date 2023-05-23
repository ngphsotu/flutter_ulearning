// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/global.dart';
import '../common.dart';
import '/app/welcome/welcome.dart';

// * WELCOME PAGE WIDGETS

PageController pageController = PageController(initialPage: 0);

// * Build Page
Column buildWelcomePage(
  int index,
  BuildContext context,
  String title,
  String subTitle,
  String imagePath,
  String buttonName,
) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.w,
        child: Image.asset(imagePath, fit: BoxFit.fill),
      ),
      Text(
        title,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 24.sp,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
        ),
      ),
      Container(
        width: 375.w,
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Text(
          subTitle,
          style: TextStyle(
            color: AppColors.primarySecondaryElementText,
            fontSize: 14.sp,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      Container(
        width: 325.w,
        height: 40.h,
        margin: EdgeInsets.only(left: 100.w, right: 100.w, top: 120.h),
        child: ReusableButton(
          buttonName: 'Next',
          backgroundColor: AppColors.primaryElement,
          onPressed: () {
            print('Press Next Button');
            // within 0-2 index
            if (index < 3) {
              // animation
              pageController.animateToPage(
                index,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 500),
              );
            } else {
              // jump to a new page
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //         builder: (context) => const HomePage(title: 'Home')),
              //  );

              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              print(
                  'The value is ${Global.storageService.getDeviceFirstOpen()}');
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/signIn', (route) => false);
            }
          },
        ),
      ),
    ],
  );
}

// * Build Dots
DotsIndicator buildDots(WelcomeState state) {
  return DotsIndicator(
    position: state.page.toDouble(),
    dotsCount: 3,
    mainAxisAlignment: MainAxisAlignment.center,
    decorator: DotsDecorator(
      color: AppColors.primaryThirdElementText,
      size: const Size.square(8),
      activeSize: const Size(18, 8),
      activeColor: AppColors.primaryElement,
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

// SmoothPageIndicator buildSmoothPageIndicator(WelcomeState state) {
//   return SmoothPageIndicator(
//     controller: pageController,
//     count: state.page,
//     effect: const WormEffect(
//       dotHeight: 16,
//       dotWidth: 16,
//       type: WormType.thinUnderground,
//     ),
//   );
// }

// * SIGNIN PAGE WIDGETS

// * Build Appbar
AppBar buildAppBar(String type) {
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

// * Build Third Party Login
// Need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons(() {
          print('Press Google Icon');
        }, 'google'),
        _reusableIcons(() {
          print('Press Apple Icon');
        }, 'apple'),
        _reusableIcons(() {
          print('Press Facebook Icon');
        }, 'facebook'),
      ],
    ),
  );
}

// * Reusable Text
Widget reusableText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: AppColors.primaryThirdElementText,
      fontSize: 14.sp,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.normal,
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
      print('Press Forgot password Text');
    },
    child: Text(
      'Forgot password ?',
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: 'Avenir',
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
      ),
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

// * HOME PAGE WIDGETS

// * Build Home Page
Widget buildHomePage(int index) {
  List<Widget> widget = [
    const Center(child: Text('Home')),
    const Center(child: Text('Search')),
    const Center(child: Text('Course')),
    const Center(child: Text('Chat')),
    const Center(child: Text('Profile')),
  ];

  return widget[index];
}

// * Bottom Tabs
var bottomTabs = [
  BottomNavigationBarItem(
    label: 'home',
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/home.png'),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        'assets/icons/home.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'search',
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/search2.png'),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        'assets/icons/search2.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'course',
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/play-circle1.png'),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        'assets/icons/play-circle1.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'chat',
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/message-circle.png'),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        'assets/icons/message-circle.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'profile',
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/person2.png'),
    ),
    activeIcon: SizedBox(
      child: Image.asset(
        'assets/icons/person2.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
];
