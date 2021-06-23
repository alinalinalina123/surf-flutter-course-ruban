import 'package:dio/dio.dart';

// API client class
class NetworkProvider {
  static final String url = 'https://test-backend-flutter.surfstudio.ru';
  Dio? dio;

  NetworkProvider(){
    dio = createDio();
  }

  BaseOptions opts = BaseOptions(
    baseUrl: url,
    connectTimeout: 50000,
    receiveTimeout: 50000,
    sendTimeout: 50000,
    headers: {"Accept":"application/json", "Content-Type":"application/json"},
  );

  Dio createDio() {
    var client = Dio(opts);
    addInterceptors(client);
    return client;
  }

  void addInterceptors(Dio dio) {
    int _maxCharactersPerLine = 200;
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioError error, handler) async {
          print("API Error -->");
          print(error.error);
          print(error.message);
          if (error.response?.statusCode == 403 ||
              error.response?.statusCode == 401) {}
          print("<-- END Api Error");
          return handler.next(error);
        },
        onRequest: (options, handler) async {
          print("--> ${options.method} ${options.uri}");
          print("Content type: ${options.contentType}");
          print("<-- END HTTP");
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          print(
              "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}");
          String responseAsString = response.data.toString();
          if (responseAsString.length > _maxCharactersPerLine) {
            int iterations =
                (responseAsString.length / _maxCharactersPerLine).floor();
            for (int i = 0; i <= iterations; i++) {
              int endingIndex =
                  i * _maxCharactersPerLine + _maxCharactersPerLine;
              if (endingIndex > responseAsString.length) {
                endingIndex = responseAsString.length;
              }
              print(responseAsString.substring(
                  i * _maxCharactersPerLine, endingIndex));
            }
          } else {
            print(response.data);
          }
          print("<-- END HTTP");
          return handler.next(response);
        },
      ),
    );
  }

  Future<String?> get(String? path, {Map<String, dynamic>? query}) async {
    try {
      Response<String>? response = await dio?.get(path ?? "", queryParameters: query);
      var statusCode = response?.statusCode ?? 0;
      if(statusCode >= 200 && statusCode <= 299) {
        return response?.data;
      } else {
        throw Exception("API EXCEPTION for GET method: \n ${response?.requestOptions.uri}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String?> delete(String? path, {Map<String, dynamic>? query}) async {
    try {
      Response<String>? response = await dio?.delete(path ?? "", queryParameters: query);
      var statusCode = response?.statusCode ?? 0;
      if(statusCode >= 200 && statusCode <= 299) {
        return response?.data;
      } else {
        throw Exception("API EXCEPTION for DELETE method: \n ${response?.requestOptions.uri}");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String?> post(String url, dynamic data) async {
    try {
      Response<String>? response = await dio?.post(url, data: data);
      var statusCode = response?.statusCode ?? 0;
      if(statusCode >= 200 && statusCode <= 299) {
        return response?.data;
      } else {
        throw Exception("API EXCEPTION for POST method: \n ${response?.requestOptions.uri}");
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<String?> put(String url, dynamic data, {Map<String, dynamic>? query}) async {
    try {
      Response<String>? response = await dio?.put(url, queryParameters: query, data: data);
      var statusCode = response?.statusCode ?? 0;
      if(statusCode >= 200 && statusCode <= 299) {
        return response?.data;
      } else {
        throw Exception("API EXCEPTION for PUT method: \n ${response?.requestOptions.uri}");
      }
    } on DioError catch (e) {
      print(e);
    }
  }
}
