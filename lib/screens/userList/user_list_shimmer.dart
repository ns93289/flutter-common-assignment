import 'package:first_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class UserListShimmer extends StatelessWidget {
  const UserListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: colorShimmerBg,
      highlightColor: colorShimmerHighlight,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(16, (index) {
          return Container(
            margin: EdgeInsetsDirectional.only(bottom: 10.h),
            padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(color: colorWhite, shape: BoxShape.circle),
                  width: 50.sp,
                  height: 50.sp,
                  margin: EdgeInsetsDirectional.only(start: 20.w, end: 10.w),
                ),
                Expanded(child: Container(color: colorWhite, height: 15.h, margin: EdgeInsetsDirectional.only(end: 20.w))),
              ],
            ),
          );
        }),
      ),
    );
  }
}
