import 'package:dio/dio.dart';

class HttpServices {
  Dio _dio;

  HttpServices() {
    _dio = Dio();
    initializeInterceptors();
  }
  Future<Response> getRequest(String endPoint) async {
    Response responce;
    print(endPoint);

    try {
      responce = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return responce;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error) {
          print(error.message);
        },
        onRequest: (request) {
          print("${request.method} ${request.path}");
        },
        onResponse: (response) {
          print(response.data);
        },
      ),
    );
  }
}
