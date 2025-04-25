import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../customWidgets/common_app_bar.dart';
import '../../customWidgets/custom_button.dart';
import '../../customWidgets/custom_text_field.dart';
import '../../network/api_reponse.dart';
import 'add_user_bloc.dart';
import 'add_user_model.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  late AddUserBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = AddUserBloc(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CommonAppBar(title: Text("Add User")), body: _buildAddUser());
  }

  Widget _buildAddUser() {
    return SafeArea(
      child: Stack(
        children: [
          Form(
            key: _bloc.formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.w, top: 20.h, end: 10.h),
                  child: CustomTextField(
                    controller: _bloc.userNameTEC,
                    decoration: InputDecoration(hintText: "Name*"),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return "Enter your name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.w, top: 20.h, end: 10.h),
                  child: CustomTextField(
                    controller: _bloc.userJobTEC,
                    decoration: InputDecoration(hintText: "Job*"),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return "Enter your job";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: StreamBuilder<ApiResponse<AddUserModel>>(
              stream: _bloc.addUserSubject,
              builder: (context, snapshot) {
                bool isLoading = snapshot.data?.apiStatus == ApiStatus.loading;

                return CustomButton(
                  title: "Add User",
                  onPress: () {
                    if (_bloc.formKey.currentState!.validate()) {
                      _bloc.callAddUserApi();
                    }
                  },
                  isLoading: isLoading,
                  margin: EdgeInsetsDirectional.only(bottom: 10.h),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
