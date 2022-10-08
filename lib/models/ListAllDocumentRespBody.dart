import 'dart:convert';

/// all documents : [{"_id":"a39a12c6-2f1c-4565-b37e-d5c03f7e65c5","document_name":"string","document_number":"string","versions":[""],"last_updated":{"$date":1665084914157},"last_updated_by":"e27e4afc-8f90-46a6-9021-bcb0dd53078d"},{"_id":"3fc1223d-e7f3-460f-8f86-1a82e7280bff","document_name":"string","document_number":"string","versions":["hello"],"last_updated":{"$date":1665085861743},"last_updated_by":"e27e4afc-8f90-46a6-9021-bcb0dd53078d"},{"_id":"08e49017-7c57-4a13-8fbf-203ab23e0a58","document_name":"World map","document_number":"12345","versions":["hello"],"last_updated":{"$date":1665085935548},"last_updated_by":"e27e4afc-8f90-46a6-9021-bcb0dd53078d"},{"_id":"193db3cf-1257-478e-bbda-b8eb89ae4dd5","document_name":"local","document_number":"1","versions":[""],"last_updated":{"$date":1665086444781},"last_updated_by":"e27e4afc-8f90-46a6-9021-bcb0dd53078d","dispatch_logs":[{"timestamp":{"$date":1665206784449},"dispatcher_user_id":"f7c4096c-22c0-4102-8953-408d92368642","reciever_user_id":"b948fcac-23da-4f1a-af41-e4119ac2bd0a","dispatcher_branch_id":"96114885-6411-45c8-b4c8-0d8235d28e64","reciever_branch_id":"38348c96-155a-4883-89aa-add96f23560c"}]},{"_id":"a848b2e3-a243-40e5-9e96-bf18aadd9835","document_name":"local image","document_number":"1","versions":[],"last_updated":{"$date":1665121356007},"last_updated_by":"e27e4afc-8f90-46a6-9021-bcb0dd53078d"},{"_id":"c5a7e896-8f78-4027-8a2b-defbcd4d8940","document_name":"local image2","document_number":"3","versions":["49151af0-14b7-4250-9d35-aa6180d9da8d"],"last_updated":{"$date":1665123482480},"last_updated_by":"e27e4afc-8f90-46a6-9021-bcb0dd53078d"},{"_id":"c9bd8f9e-98e1-45f3-94fe-44dfdde4d9b1","document_name":"cow image","document_number":"4","versions":["df36c0e6-4c40-4a69-afb9-8d55e9d7a675","27c2c670-6882-429a-9f0d-e48003face1f"],"last_updated":{"$date":1665127078639},"last_updated_by":"e27e4afc-8f90-46a6-9021-bcb0dd53078d"},{"_id":"3324c394-e309-4ca6-a170-6d09e32da1d7","document_name":"a cow image","document_number":"6","versions":["a9ad09f3-0a97-4453-9630-f8d9c0eec3aa"],"last_updated":{"$date":1665149608249},"last_updated_by":"e27e4afc-8f90-46a6-9021-bcb0dd53078d","is_active":true,"dispatch_logs":[]},{"_id":"2ba33e0a-0eae-4179-b89e-603efcd0407a","document_name":"Hello World Image","document_number":"1234556","versions":["dd742a74-145a-4f90-895f-a91434f34943"],"last_updated":{"$date":1665159296682},"last_updated_by":"e27e4afc-8f90-46a6-9021-bcb0dd53078d","is_active":true,"dispatch_logs":[]},{"_id":"aa0823b9-3778-4874-b7bb-1d81a6055a7a","document_name":"Demo document","document_number":"AABB1234","versions":["8770a0b7-faf8-4d59-811a-910eb9366122"],"last_updated":{"$date":1665202697835},"last_updated_by":"b948fcac-23da-4f1a-af41-e4119ac2bd0a","is_active":true,"dispatch_logs":[""]},{"_id":"ecf9e38f-1141-4db5-9c38-dda67270f71e","document_name":"Demo document2","document_number":"XYXYXYXYXYYY","versions":["c983a469-aac3-4cf2-8f64-b421f9aa1409"],"last_updated":{"$date":1665211512154},"last_updated_by":"b948fcac-23da-4f1a-af41-e4119ac2bd0a","is_active":true,"dispatch_logs":[""]}]

ListAllDocumentRespBody listAllDocumentRespBodyFromJson(String str) =>
    ListAllDocumentRespBody.fromJson(json.decode(str));

String listAllDocumentRespBodyToJson(ListAllDocumentRespBody data) =>
    json.encode(data.toJson());

class ListAllDocumentRespBody {
  ListAllDocumentRespBody({
    List<AllDocuments>? alldocuments,
  }) {
    _alldocuments = alldocuments;
  }

  ListAllDocumentRespBody.fromJson(dynamic json) {
    if (json['all documents'] != null) {
      _alldocuments = [];
      json['all documents'].forEach((v) {
        _alldocuments?.add(AllDocuments.fromJson(v));
      });
    }
  }

  List<AllDocuments>? _alldocuments;

  ListAllDocumentRespBody copyWith({
    List<AllDocuments>? alldocuments,
  }) =>
      ListAllDocumentRespBody(
        alldocuments: alldocuments ?? _alldocuments,
      );

  List<AllDocuments>? get alldocuments => _alldocuments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_alldocuments != null) {
      map['all documents'] = _alldocuments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "a39a12c6-2f1c-4565-b37e-d5c03f7e65c5"
/// document_name : "string"
/// document_number : "string"
/// versions : [""]
/// last_updated : {"$date":1665084914157}
/// last_updated_by : "e27e4afc-8f90-46a6-9021-bcb0dd53078d"

AllDocuments allDocumentsFromJson(String str) =>
    AllDocuments.fromJson(json.decode(str));

String allDocumentsToJson(AllDocuments data) => json.encode(data.toJson());

class AllDocuments {
  AllDocuments({
    String? id,
    String? documentName,
    String? documentNumber,
    List<String>? versions,
    LastUpdated? lastUpdated,
    String? lastUpdatedBy,
  }) {
    _id = id;
    _documentName = documentName;
    _documentNumber = documentNumber;
    _versions = versions;
    _lastUpdated = lastUpdated;
    _lastUpdatedBy = lastUpdatedBy;
  }

  AllDocuments.fromJson(dynamic json) {
    _id = json['_id'];
    _documentName = json['document_name'];
    _documentNumber = json['document_number'];
    _versions = json['versions'] != null ? json['versions'].cast<String>() : [];
    _lastUpdated = json['last_updated'] != null
        ? LastUpdated.fromJson(json['last_updated'])
        : null;
    _lastUpdatedBy = json['last_updated_by'];
  }

  String? _id;
  String? _documentName;
  String? _documentNumber;
  List<String>? _versions;
  LastUpdated? _lastUpdated;
  String? _lastUpdatedBy;

  AllDocuments copyWith({
    String? id,
    String? documentName,
    String? documentNumber,
    List<String>? versions,
    LastUpdated? lastUpdated,
    String? lastUpdatedBy,
  }) =>
      AllDocuments(
        id: id ?? _id,
        documentName: documentName ?? _documentName,
        documentNumber: documentNumber ?? _documentNumber,
        versions: versions ?? _versions,
        lastUpdated: lastUpdated ?? _lastUpdated,
        lastUpdatedBy: lastUpdatedBy ?? _lastUpdatedBy,
      );

  String? get id => _id;

  String? get documentName => _documentName;

  String? get documentNumber => _documentNumber;

  List<String>? get versions => _versions;

  LastUpdated? get lastUpdated => _lastUpdated;

  String? get lastUpdatedBy => _lastUpdatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['document_name'] = _documentName;
    map['document_number'] = _documentNumber;
    map['versions'] = _versions;
    if (_lastUpdated != null) {
      map['last_updated'] = _lastUpdated?.toJson();
    }
    map['last_updated_by'] = _lastUpdatedBy;
    return map;
  }
}

/// $date : 1665084914157

LastUpdated lastUpdatedFromJson(String str) =>
    LastUpdated.fromJson(json.decode(str));

String lastUpdatedToJson(LastUpdated data) => json.encode(data.toJson());

class LastUpdated {
  LastUpdated({
    num? date,
  }) {
    _date = date;
  }

  LastUpdated.fromJson(dynamic json) {
    _date = json['$date'];
  }

  num? _date;

  LastUpdated copyWith({
    num? date,
  }) =>
      LastUpdated(
        date: date ?? _date,
      );

  num? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$date'] = _date;
    return map;
  }
}
