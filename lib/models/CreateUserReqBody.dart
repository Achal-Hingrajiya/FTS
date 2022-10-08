import 'dart:convert';
/// full_name : "Achal Hingrajiya"
/// email : "achal@gmail.com"
/// password : "123456"
/// mobile_number : "7894561235"
/// date_of_birth : "2022-10-07"
/// permissions : ["All permissions"]
/// active_documents : ["123456","456789"]
/// closed_documents : ["753789","789456"]

CreateUserReqBody createUserReqBodyFromJson(String str) => CreateUserReqBody.fromJson(json.decode(str));
String createUserReqBodyToJson(CreateUserReqBody data) => json.encode(data.toJson());
class CreateUserReqBody {
  CreateUserReqBody({
      String? fullName, 
      String? email, 
      String? password, 
      String? mobileNumber, 
      String? dateOfBirth, 
      List<String>? permissions, 
      List<String>? activeDocuments, 
      List<String>? closedDocuments,}){
    _fullName = fullName;
    _email = email;
    _password = password;
    _mobileNumber = mobileNumber;
    _dateOfBirth = dateOfBirth;
    _permissions = permissions;
    _activeDocuments = activeDocuments;
    _closedDocuments = closedDocuments;
}

  CreateUserReqBody.fromJson(dynamic json) {
    _fullName = json['full_name'];
    _email = json['email'];
    _password = json['password'];
    _mobileNumber = json['mobile_number'];
    _dateOfBirth = json['date_of_birth'];
    _permissions = json['permissions'] != null ? json['permissions'].cast<String>() : [];
    _activeDocuments = json['active_documents'] != null ? json['active_documents'].cast<String>() : [];
    _closedDocuments = json['closed_documents'] != null ? json['closed_documents'].cast<String>() : [];
  }
  String? _fullName;
  String? _email;
  String? _password;
  String? _mobileNumber;
  String? _dateOfBirth;
  List<String>? _permissions;
  List<String>? _activeDocuments;
  List<String>? _closedDocuments;
CreateUserReqBody copyWith({  String? fullName,
  String? email,
  String? password,
  String? mobileNumber,
  String? dateOfBirth,
  List<String>? permissions,
  List<String>? activeDocuments,
  List<String>? closedDocuments,
}) => CreateUserReqBody(  fullName: fullName ?? _fullName,
  email: email ?? _email,
  password: password ?? _password,
  mobileNumber: mobileNumber ?? _mobileNumber,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  permissions: permissions ?? _permissions,
  activeDocuments: activeDocuments ?? _activeDocuments,
  closedDocuments: closedDocuments ?? _closedDocuments,
);
  String? get fullName => _fullName;
  String? get email => _email;
  String? get password => _password;
  String? get mobileNumber => _mobileNumber;
  String? get dateOfBirth => _dateOfBirth;
  List<String>? get permissions => _permissions;
  List<String>? get activeDocuments => _activeDocuments;
  List<String>? get closedDocuments => _closedDocuments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = _fullName;
    map['email'] = _email;
    map['password'] = _password;
    map['mobile_number'] = _mobileNumber;
    map['date_of_birth'] = _dateOfBirth;
    map['permissions'] = _permissions;
    map['active_documents'] = _activeDocuments;
    map['closed_documents'] = _closedDocuments;
    return map;
  }

}