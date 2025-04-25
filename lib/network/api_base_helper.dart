import 'package:dio/dio.dart';
import 'package:first_app/network/api_constant.dart';

class ApiBaseHelper {
  final _dio = Dio();

  ApiBaseHelper({String? baseUrl}) {
    _dio.options.baseUrl = baseUrl ?? BaseUrl.apiUrl;
    _dio.options.receiveTimeout = Duration(seconds: 3);
    _dio.options.connectTimeout = Duration(seconds: 3);
    _dio.interceptors.add(LogInterceptor(request: true, responseBody: true, requestHeader: true));
  }

  dynamic post({required String api, Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    Response response = await _dio.post(api, data: body, queryParameters: queryParameters);
    try {
      return response.data;
    } catch (e) {
      return e.toString();
    }
  }

  dynamic postForm({required String api, FormData? body, Map<String, dynamic>? queryParameters}) async {
    Response response = await _dio.post(api, data: body, queryParameters: queryParameters);
    try {
      return response.data;
    } catch (e) {
      return e.toString();
    }
  }

  dynamic get({required String api, Map<String, dynamic>? queryParameters}) async {
    Response response = await _dio.get(api, queryParameters: queryParameters);
    try {
      return response.data;
    } catch (e) {
      return e.toString();
    }
  }
}
