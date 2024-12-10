import 'package:dio/dio.dart';

class DioClient {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',      
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
     String? lang,
    String? token,
  }) async {
    dio?.options.headers={
        "lang":lang,
      "Authorization":token,
      };
    try {
      final response = await dio!.get(
        endpoint,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang,
    String? token,
  }) async {
    dio?.options.headers={
        "lang":lang,
      "Authorization":token,
      };
    
    try {
      return await dio!.post(
        url,
        queryParameters: query,
        data: data,
      );
    } catch (e) {
      rethrow;
    }
  }
}
