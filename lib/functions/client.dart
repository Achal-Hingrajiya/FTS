import 'package:dio/dio.dart';
import 'package:office_doc_tracing/models/GetTokenBody.dart';
import 'package:office_doc_tracing/models/SignUpBody.dart';
import 'package:office_doc_tracing/models/SignUpSuccessResponse.dart';

class APICLient {
  final Dio dio = Dio();

  Future<String?> register(
    String username,
    String fullName,
    String email,
    bool isCreater,
    String password,
  ) async {
    var data = SignUpBody(
      username: username,
      fullName: fullName,
      email: email,
      isCreater: isCreater,
      password: password,
    );

    try {
      final response = await dio.post(
        "http://192.168.189.100:8080/sign_up",
        options: Options(headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json'
        }),
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        print("Registration successful");
        print('Registration Response: ${response.data}');
        return SignUpSuccessResponse.fromJson(response.data).user;
      }
      return null;
    } catch (e) {
      print("Error occurred.\n${e.toString()}");
      return null;
    }
  }

  Future<String?>? getToken(
    String username,
    String password,
  ) async {
    var data = GetTokenBody(
      username: username,
      password: password,
    );
    try {
      final response = await dio.post(
        "http://192.168.189.100:8080/token",
        options: Options(headers: {
          'accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded'
        }),
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        print("Registration successful");
        print('Registration Response: ${response.data}');
        // return SignUpSuccessResponse.fromJson(response.data).user;
      }
      print('Registration Response with error: ${response.data}');

      return null;
    } catch (e) {
      print("Error occurred.\n${e.toString()}");
      return null;
    }

  }
}
