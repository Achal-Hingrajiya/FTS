import 'package:dio/dio.dart';
import 'package:office_doc_tracing/constants.dart';
import 'package:office_doc_tracing/models/CreateUserReqBody.dart';
import 'package:office_doc_tracing/models/CreateUserResBody.dart';
import 'package:office_doc_tracing/models/GetTokenBody.dart';
import 'package:office_doc_tracing/models/TokenResponseBody.dart';

class APICLient {
  final Dio dio = Dio();

  Future<CreateUserResBody?> createUser(
    String token,
    String fullName,
    String email,
    String password,
    String mobileNumber,
    String dateOfBirth,
    List<String> permissions,
    List<String> active_documents,
    List<String> closed_documents,
  ) async {
    var data = CreateUserReqBody(
      fullName: fullName,
      email: email,
      password: password,
      mobileNumber: mobileNumber,
      dateOfBirth: dateOfBirth,
      permissions: permissions,
      activeDocuments: active_documents,
      closedDocuments: closed_documents,
    );

    // print("Tooken while creating user: $token");
    try {
      final response = await dio.post(
        "$baseURL/users/create_user",
        options: Options(headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        print("User Creation successful");
        print('User Creation Response: ${response.data}');
        return CreateUserResBody.fromJson(response.data);
      } else if (response.statusCode == 422) {
        print("User Creation Failed Due to 422");
        print('User Creation Response: ${response.data}');
      }
      return null;
    } catch (e) {
      print("Error occurred while creating user in client.\n${e.toString()}");
      return null;
    }
  }

  Future<TokenResponseBody?> getToken(
    String username,
    String password,
  ) async {
    var data = GetTokenBody(
      username: username,
      password: password,
    );
    try {
      final response = await dio.post(
        "$baseURL/token",
        options: Options(headers: {
          'accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded'
        }),
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        print("Login successful");
        print('Login Response: ${response.data}');
        return TokenResponseBody.fromJson(response.data);
      } else {
        print('Login Response with error: ${response.data}');
      }
      return null;
    } catch (e) {
      print("Error occurred.\n${e.toString()}");
      return null;
    }
  }

  // Future<>
}
