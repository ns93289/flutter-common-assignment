import 'package:first_app/network/api_reponse.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../bloc/bloc.dart';
import '../../network/api_repository.dart';
import 'user_list_model.dart';

class UserListBloc extends Bloc {
  final BuildContext context;

  UserListBloc(this.context) {
    pagingController.addPageRequestListener((pageKey) {
      callListApi(pageKey);
    });
  }

  final UserRepo _listRepo = UserRepo();

  final listSubject = BehaviorSubject<ApiResponse<String>>();

  final pagingController = PagingController<int, UserData>(firstPageKey: 1);

  callListApi(int pageKey) async {
    try {
      listSubject.add(ApiResponse.loading());

      final data = UserListModel.fromJson(await _listRepo.getUserList(pageKey));

      if (data.userDataList.isNotEmpty) {
        if (pageKey == data.totalPages) {
          pagingController.appendLastPage(data.userDataList);
        } else {
          pagingController.appendPage(data.userDataList, pageKey + 1);
        }
      }
    } catch (e) {
      pagingController.error = e.toString();
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    listSubject.close();
    pagingController.dispose();
  }
}
