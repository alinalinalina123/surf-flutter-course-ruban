
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:places/network/network_provider.dart';

/// Repository for media
class MediaRepository {

  static final provider = NetworkProvider();

  //Upload image
  Future<dynamic> uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file":
      await MultipartFile.fromFile(file.path, filename:fileName),
    });
    return await provider.postHTTP("/upload_file", formData);
  }
}