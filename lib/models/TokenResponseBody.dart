import 'dart:convert';

/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ2YkBleGFtcGxlLmNvbSIsImV4cCI6MTY2NTEyMjgzMX0.Tn_P7fz6wwJ0-XCOXMptb0g3s5f4ra7qiPRVy9WKaow"
/// token_type : "bearer"

TokenResponseBody tokenResponseBodyFromJson(String str) =>
    TokenResponseBody.fromJson(json.decode(str));

String tokenResponseBodyToJson(TokenResponseBody data) =>
    json.encode(data.toJson());

class TokenResponseBody {
  TokenResponseBody({
    String? accessToken,
    String? tokenType,
  }) {
    _accessToken = accessToken;
    _tokenType = tokenType;
  }

  TokenResponseBody.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
  }

  String? _accessToken;
  String? _tokenType;

  TokenResponseBody copyWith({
    String? accessToken,
    String? tokenType,
  }) =>
      TokenResponseBody(
        accessToken: accessToken ?? _accessToken,
        tokenType: tokenType ?? _tokenType,
      );

  String? get accessToken => _accessToken;

  String? get tokenType => _tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    return map;
  }
}
