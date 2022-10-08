import 'dart:convert';

/// branch_name : "ROOT BRANCH"
/// description : "ROOT BRANCH"
/// branch_address : "ADDRESS"
/// city : "CITY"
/// state : "STATE"
/// country : "COUNTRY"
/// pin : 123456

CreateBranchReqBody createBranchReqBodyFromJson(String str) =>
    CreateBranchReqBody.fromJson(json.decode(str));

String createBranchReqBodyToJson(CreateBranchReqBody data) =>
    json.encode(data.toJson());

class CreateBranchReqBody {
  CreateBranchReqBody({
    String? branchName,
    String? description,
    String? branchAddress,
    String? city,
    String? state,
    String? country,
    String? pin,
  }) {
    _branchName = branchName;
    _description = description;
    _branchAddress = branchAddress;
    _city = city;
    _state = state;
    _country = country;
    _pin = pin;
  }

  CreateBranchReqBody.fromJson(dynamic json) {
    _branchName = json['branch_name'];
    _description = json['description'];
    _branchAddress = json['branch_address'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _pin = json['pin'];
  }

  String? _branchName;
  String? _description;
  String? _branchAddress;
  String? _city;
  String? _state;
  String? _country;
  String? _pin;

  CreateBranchReqBody copyWith({
    String? branchName,
    String? description,
    String? branchAddress,
    String? city,
    String? state,
    String? country,
    String? pin,
  }) =>
      CreateBranchReqBody(
        branchName: branchName ?? _branchName,
        description: description ?? _description,
        branchAddress: branchAddress ?? _branchAddress,
        city: city ?? _city,
        state: state ?? _state,
        country: country ?? _country,
        pin: pin ?? _pin,
      );

  String? get branchName => _branchName;

  String? get description => _description;

  String? get branchAddress => _branchAddress;

  String? get city => _city;

  String? get state => _state;

  String? get country => _country;

  String? get pin => _pin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branch_name'] = _branchName;
    map['description'] = _description;
    map['branch_address'] = _branchAddress;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['pin'] = _pin;
    return map;
  }
}
