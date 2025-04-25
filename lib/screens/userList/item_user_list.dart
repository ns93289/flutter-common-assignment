import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/constants/colors.dart';
import 'package:first_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user_list_model.dart';

class ItemUserList extends StatelessWidget {
  final UserData userData;

  const ItemUserList({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final UserData(:avatar, :firstName, :lastName) = userData;
    return Container(
      color: colorWhite,
      margin: EdgeInsetsDirectional.only(bottom: 10.h),
      padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(color: colorWhite, shape: BoxShape.circle),
            width: 50.sp,
            height: 50.sp,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: EdgeInsetsDirectional.only(start: 20.w, end: 10.w),
            child: CachedNetworkImage(
              imageUrl: avatar,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 50.sp,
              height: 50.sp,
            ),
          ),
          Expanded(child: Text("$firstName $lastName", style: bodyTextStyle())),
          SizedBox(width: 20.w),
        ],
      ),
    );
  }
}
