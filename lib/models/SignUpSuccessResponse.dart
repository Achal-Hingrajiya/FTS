import 'dart:convert';

/// user : "string67"

SignUpSuccessResponse signUpSuccessResponseFromJson(String str) =>
    SignUpSuccessResponse.fromJson(json.decode(str));

String signUpSuccessResponseToJson(SignUpSuccessResponse data) =>
    json.encode(data.toJson());

class SignUpSuccessResponse {
  SignUpSuccessResponse({
    String? user,
  }) {
    _user = user;
  }

  SignUpSuccessResponse.fromJson(dynamic json) {
    _user = json['user'];
  }

  String? _user;

  SignUpSuccessResponse copyWith({
    String? user,
  }) =>
      SignUpSuccessResponse(
        user: user ?? _user,
      );

  String? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = _user;
    return map;
  }
}
