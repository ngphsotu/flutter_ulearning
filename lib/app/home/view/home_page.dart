import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ulearning/app/home/home.dart';
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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              slivers: [
                SliverToBoxAdapter(
                    child: buildHomePageText('Hello,',
                        color: AppColors.primaryThirdElementText)),
                SliverToBoxAdapter(child: buildHomePageText('Tung', top: 5)),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(child: buildSearchView()),
                SliverToBoxAdapter(child: buildSlidersView(context, state)),
                SliverToBoxAdapter(child: buildMenuView()),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 4,
                      (context, index) => GestureDetector(
                        onTap: () {},
                        child: courseGrid(),
                      ),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
