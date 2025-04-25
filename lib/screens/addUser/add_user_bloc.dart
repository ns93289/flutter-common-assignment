import 'package:first_app/bloc/bloc.dart';
import 'package:first_app/network/api_reponse.dart';
import 'package:first_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../network/api_repository.dart';
import 'add_user_model.dart';

class AddUserBloc extends Bloc {
  final BuildContext context;

  AddUserBloc(this.context);

  final UserRepo _userRepo = UserRepo();

  final formKey = GlobalKey<FormState>();

  final userNameTEC = TextEditingController();
  final userJobTEC = TextEditingController();

  final addUserSubject = BehaviorSubject<ApiResponse<AddUserModel>>();

  callAddUserApi() async {
    try {
      addUserSubject.add(ApiResponse.loading());
      final AddUserModel data = AddUserModel.fromJson(await _userRepo.addUserRecord(name: userNameTEC.text, job: userJobTEC.text));
      if (data.id.isNotEmpty) {
        addUserSubject.add(ApiResponse.complete());
        if (!context.mounted) return;
        openSimpleSnackBar("User added successfully");
        Navigator.pop(context);
      } else {
        addUserSubject.add(ApiResponse.error(message: "Api response error"));
      }
    } catch (e) {
      addUserSubject.add(ApiResponse.error(message: e.toString()));
    }
  }

  @override
  void dispose() {
    userNameTEC.dispose();
    userJobTEC.dispose();
    addUserSubject.close();
  }
}
