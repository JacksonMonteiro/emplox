// ignore_for_file: unnecessary_getters_setters

class AdminModel {
  int? _id;
  String? _username;
  String? _email;
  String? _password;

  AdminModel({int? id, String? username, String? email, String? password}) {
    if (id != null) {
      _id = id;
    }
    if (username != null) {
      _username = username;
    }
    if (email != null) {
      _email = email;
    }
    if (password != null) {
      _password = password;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get password => _password;
  set password(String? password) => _password = password;

  AdminModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['username'] = _username;
    data['email'] = _email;
    data['password'] = _password;
    return data;
  }
}
