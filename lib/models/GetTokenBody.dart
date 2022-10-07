import 'dart:convert';

/// username : "Achal"
/// password : "Password"

GetTokenBody getTokenBodyFromJson(String str) =>
    GetTokenBody.fromJson(json.decode(str));

String getTokenBodyToJson(GetTokenBody data) => json.encode(data.toJson());

class GetTokenBody {
  GetTokenBody({
    String? username,
    String? password,
  }) {
    _username = username;
    _password = password;
  }

  GetTokenBody.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
  }

  String? _username;
  String? _password;

  GetTokenBody copyWith({
    String? username,
    String? password,
  }) =>
      GetTokenBody(
        username: username ?? _username,
        password: password ?? _password,
      );

  String? get username => _username;

  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    return map;
  }
}
