class AddUserModel {
  AddUserModel({String? id, String? createdAt}) {
    _id = id;
    _createdAt = createdAt;
  }

  AddUserModel.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
  }

  String? _id;
  String? _createdAt;

  String get id => _id ?? "";

  String get createdAt => _createdAt ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    return map;
  }
}
