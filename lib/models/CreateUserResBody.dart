import 'dart:convert';
/// user_id : "392f079c-c1e6-45db-a5f5-32299427f045"
/// full_name : "Hirva Khunt"
/// email : "hirva@gmail.com"

CreateUserResBody createUserResBodyFromJson(String str) => CreateUserResBody.fromJson(json.decode(str));
String createUserResBodyToJson(CreateUserResBody data) => json.encode(data.toJson());
class CreateUserResBody {
  CreateUserResBody({
      String? userId, 
      String? fullName, 
      String? email,}){
    _userId = userId;
    _fullName = fullName;
    _email = email;
}

  CreateUserResBody.fromJson(dynamic json) {
    _userId = json['user_id'];
    _fullName = json['full_name'];
    _email = json['email'];
  }
  String? _userId;
  String? _fullName;
  String? _email;
CreateUserResBody copyWith({  String? userId,
  String? fullName,
  String? email,
}) => CreateUserResBody(  userId: userId ?? _userId,
  fullName: fullName ?? _fullName,
  email: email ?? _email,
);
  String? get userId => _userId;
  String? get fullName => _fullName;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['full_name'] = _fullName;
    map['email'] = _email;
    return map;
  }

}