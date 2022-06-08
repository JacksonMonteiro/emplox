// ignore_for_file: unnecessary_getters_setters

class EmployeeModel {
  int? _id;
  String? _name;
  String? _role;

  EmployeeModel({int? id, String? name, String? role}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (role != null) {
      _role = role;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get role => _role;
  set role(String? role) => _role = role;

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['role'] = _role;
    return data;
  }
}
