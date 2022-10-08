import 'dart:convert';

/// message : "Branch created successfully"

CreateBranchResBody createBranchResBodyFromJson(String str) =>
    CreateBranchResBody.fromJson(json.decode(str));

String createBranchResBodyToJson(CreateBranchResBody data) =>
    json.encode(data.toJson());

class CreateBranchResBody {
  CreateBranchResBody({
    String? message,
  }) {
    _message = message;
  }

  CreateBranchResBody.fromJson(dynamic json) {
    _message = json['message'];
  }

  String? _message;

  CreateBranchResBody copyWith({
    String? message,
  }) =>
      CreateBranchResBody(
        message: message ?? _message,
      );

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}
