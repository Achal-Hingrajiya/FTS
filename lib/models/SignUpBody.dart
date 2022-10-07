import 'dart:convert';
/// user_id : 0
/// username : "string"
/// full_name : "string"
/// email : "string"
/// is_creater : true
/// password : "string"

SignUpBody signUpBodyFromJson(String str) => SignUpBody.fromJson(json.decode(str));
String signUpBodyToJson(SignUpBody data) => json.encode(data.toJson());
class SignUpBody {
  SignUpBody({
      num? userId,
      String? username,
      String? fullName,
      String? email,
      bool? isCreater,
      String? password,}){
    _userId = userId;
    _username = username;
    _fullName = fullName;
    _email = email;
    _isCreater = isCreater;
    _password = password;
}

  SignUpBody.fromJson(dynamic json) {
    _userId = json['user_id'];
    _username = json['username'];
    _fullName = json['full_name'];
    _email = json['email'];
    _isCreater = json['is_creater'];
    _password = json['password'];
  }
  num? _userId;
  String? _username;
  String? _fullName;
  String? _email;
  bool? _isCreater;
  String? _password;
SignUpBody copyWith({  num? userId,
  String? username,
  String? fullName,
  String? email,
  bool? isCreater,
  String? password,
}) => SignUpBody(  userId: userId ?? _userId,
  username: username ?? _username,
  fullName: fullName ?? _fullName,
  email: email ?? _email,
  isCreater: isCreater ?? _isCreater,
  password: password ?? _password,
);
  num? get userId => _userId;
  String? get username => _username;
  String? get fullName => _fullName;
  String? get email => _email;
  bool? get isCreater => _isCreater;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['username'] = _username;
    map['full_name'] = _fullName;
    map['email'] = _email;
    map['is_creater'] = _isCreater;
    map['password'] = _password;
    return map;
  }

}