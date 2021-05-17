import 'package:dio/dio.dart';
import 'package:places/network/network_provider.dart';

/// Api provider for places data
class PlacesApiProvider {
  static final provider = NetworkProvider();

  //Test method
  Future<String?> test() async {
    try {
      var response = await provider.getHTTP('/users');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
