import 'package:first_app/constants/colors.dart';
import 'package:first_app/customWidgets/custom_button.dart';
import 'package:first_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../customWidgets/common_app_bar.dart';
import '../../customWidgets/common_circle_progress_bar.dart';
import '../../customWidgets/empty_record_view.dart';
import '../addUser/add_user_screen.dart';
import '../movieList/movie_list_screen.dart';
import 'item_user_list.dart';
import 'user_list_bloc.dart';
import 'user_list_model.dart';
import 'user_list_shimmer.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late UserListBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = UserListBloc(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: Text("User List"), centerTitle: true),
      body: SafeArea(
        child: Stack(
          children: [
            _userList(),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                title: "Add User",
                onPress: () {
                  openScreen(context, AddUserScreen());
                },
                margin: EdgeInsetsDirectional.only(bottom: 10.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userList() {
    return PagedListView<int, UserData>(
      pagingController: _bloc.pagingController,
      padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) {
          return GestureDetector(
            onTap: () {
              openScreen(context, MovieListScreen());
            },
            child: ItemUserList(userData: item),
          );
        },
        newPageProgressIndicatorBuilder: (context) {
          return CommonCircleProgressBar(color: colorBlack);
        },
        firstPageProgressIndicatorBuilder: (context) {
          return UserListShimmer();
        },
        firstPageErrorIndicatorBuilder: (context) {
          return EmptyRecordView(message: _bloc.pagingController.error);
        },
      ),
    );
  }
}
