import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../profile.dart';
import '/common/common.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profileIconAndEditButton(),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 28.w, right: 28.w),
                child: buildListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
