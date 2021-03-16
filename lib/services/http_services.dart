import 'package:dio/dio.dart';

class HttpServices {
  Dio _dio;
  // var baseUrl = "";

  HttpServices() {
    // print("Sanket HTP SERVIce $seledate");
    _dio = Dio(BaseOptions(
      baseUrl:
          "https://api.nasa.gov/planetary/apod?api_key=aWPhODExHc5j48m59viPzCysv1jkoaN7ID2dchPw&date=2017-07-10",
    ));
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
