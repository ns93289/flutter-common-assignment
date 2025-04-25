class UserListModel {
  UserListModel({int? page, int? perPage, int? total, int? totalPages, List<UserData>? data, Support? support}) {
    _page = page;
    _perPage = perPage;
    _total = total;
    _totalPages = totalPages;
    _userDataList = data;
    _support = support;
  }

  UserListModel.fromJson(dynamic json) {
    _page = json['page'];
    _perPage = json['per_page'];
    _total = json['total'];
    _totalPages = json['total_pages'];
    if (json['data'] != null) {
      _userDataList = [];
      json['data'].forEach((v) {
        _userDataList?.add(UserData.fromJson(v));
      });
    }
    _support = json['support'] != null ? Support.fromJson(json['support']) : null;
  }

  int? _page;
  int? _perPage;
  int? _total;
  int? _totalPages;
  List<UserData>? _userDataList;
  Support? _support;

  int get page => _page ?? 0;

  int get perPage => _perPage ?? 0;

  int get total => _total ?? 0;

  int get totalPages => _totalPages ?? 0;

  List<UserData> get userDataList => _userDataList ?? [];

  Support? get support => _support;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    map['per_page'] = _perPage;
    map['total'] = _total;
    map['total_pages'] = _totalPages;
    if (_userDataList != null) {
      map['data'] = _userDataList?.map((v) => v.toJson()).toList();
    }
    if (_support != null) {
      map['support'] = _support?.toJson();
    }
    return map;
  }
}

class Support {
  Support({String? url, String? text}) {
    _url = url;
    _text = text;
  }

  Support.fromJson(dynamic json) {
    _url = json['url'];
    _text = json['text'];
  }

  String? _url;
  String? _text;

  String? get url => _url;

  String? get text => _text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['text'] = _text;
    return map;
  }
}

class UserData {
  UserData({int? id, String? email, String? firstName, String? lastName, String? avatar}) {
    _id = id;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _avatar = avatar;
  }

  UserData.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _avatar = json['avatar'];
  }

  int? _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _avatar;

  int get id => _id ?? 0;

  String get email => _email ?? "";

  String get firstName => _firstName ?? "";

  String get lastName => _lastName ?? "";

  String get avatar => _avatar ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['avatar'] = _avatar;
    return map;
  }
}
