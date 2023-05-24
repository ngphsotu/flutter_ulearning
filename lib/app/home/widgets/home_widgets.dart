import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../home.dart';
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
      child: ReusableText(
        text: text,
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ));
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

// * Build Sliders View
Widget buildSlidersView(context, state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            if (kDebugMode) {
              print('Index: $value');
            }
            // context.read<HomeBloc>().add(HomeDots(value));
          },
          children: [
            _buildSlidersContainer('image_1'),
            _buildSlidersContainer('image_2'),
            _buildSlidersContainer('image_3'),
          ],
        ),
      ),
      Container(child: _buildDots(state)),
    ],
  );
}

// * Build Sliders Container
Widget _buildSlidersContainer(String imageName) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/icons/$imageName.png'),
      ),
    ),
  );
}

// * Build Dots Home Page
Widget _buildDots(HomeState state) {
  return DotsIndicator(
    position: state.index,
    dotsCount: 3,
    decorator: DotsDecorator(
      size: const Size.square(5),
      color: AppColors.primaryThirdElementText,
      activeSize: const Size(17, 5),
      activeColor: AppColors.primaryElement,
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

// * Build Menu View Home Page
Widget buildMenuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableText('Choose your course'),
            GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  print('Tap See All Text');
                }
              },
              child: _reusableText(
                'See All',
                color: AppColors.primaryThirdElementText,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  print('Tap All');
                }
              },
              child: _menuText('All'),
            ),
            GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  print('Tap Popular');
                }
              },
              child: _menuText(
                'Popular',
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: AppColors.primaryBackground,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (kDebugMode) {
                  print('Tap Newest');
                }
              },
              child: _menuText(
                'Newest',
                textColor: AppColors.primaryThirdElementText,
                backGroundColor: AppColors.primaryBackground,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableText(String text,
    {int fontSize = 16,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold}) {
  return ReusableText(
    text: text,
    color: color,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}

Widget _menuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backGroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 15.w, right: 15.w),
    decoration: BoxDecoration(
      color: backGroundColor,
      border: Border.all(color: backGroundColor),
      borderRadius: BorderRadius.circular(7.w),
    ),
    child: _reusableText(
      menuText,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
  );
}

// * Build Course Grid
Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/icons/image_3.png'),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          text: 'Best code for IT and Engineering',
          color: AppColors.primaryElementText,
          overflow: TextOverflow.fade,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 5.h),
        ReusableText(
          text: 'Flutter best course',
          color: AppColors.primaryFourthElementText,
          overflow: TextOverflow.fade,
          fontSize: 8.sp,
          fontWeight: FontWeight.normal,
        ),
      ],
    ),
  );
}
