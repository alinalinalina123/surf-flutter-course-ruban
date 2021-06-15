import 'package:dio/dio.dart';

// API client class
class NetworkProvider {
  static final String url = "https://jsonplaceholder.typicode.com";
  //'https://test-backend-flutter.surfstudio.ru'
  
  final dio = createDio();

  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: 5000,
    receiveTimeout: 5000,
    sendTimeout: 5000,
    contentType: Headers.jsonContentType,
  );

  static Dio createDio() {
    var client = Dio(opts);
    addInterceptors(client);
    return client;
  }

  static void addInterceptors(Dio dio) {
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

  Future<Response?> getHTTP(String? path) async {
    try {
      var response = await dio.get(path ?? "");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<Response?> postHTTP(String url, dynamic data) async {
    try {
      Response response = await dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      // Handle error
    }
  }

  Future<Response?> putHTTP(String url, dynamic data) async {
    try {
      Response response = await dio.put(url, data: data);
      return response;
    } on DioError catch (e) {
      // Handle error
    }
  }
}
