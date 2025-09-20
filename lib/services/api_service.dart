import 'package:dio/dio.dart';

class ApiService {
  Dio dio;
  ApiService(this.dio);
  final _baseUrl = "https://api.alquran.cloud/v1/";
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
