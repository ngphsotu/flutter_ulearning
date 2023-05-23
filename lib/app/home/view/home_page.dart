import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/common/common.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildHomeAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHomePageText(
              'Hello',
              color: AppColors.primaryThirdElementText,
            ),
            buildHomePageText(
              'Tung',
              top: 5,
            ),
            SizedBox(height: 25.h),
            buildSearchView(),
          ],
        ),
      ),
    );
  }
}
