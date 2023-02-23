import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  static String apiUrl = 'https://63f7311e833c7c9c607e77a8.mockapi.io/';

  late Dio _dio;

  Dio get dio => _dio;

  /// Class for generic call to Api
  ApiService() {
    /// Options Headers + begin url api
    final BaseOptions options = BaseOptions(
      baseUrl: apiUrl,

      // connectTimeout: 30000,
      // receiveTimeout: 30000,
      validateStatus: (int? status) {
        return status! < 500;
      },
    );
    _dio = Dio(options);
  }

  void _setDioBaseUrl({
    int version = 0,
  }) {
    if (version > 0) {
      _dio.options.baseUrl = apiUrl + '/api/v$version';
    } else {
      _dio.options.baseUrl = apiUrl + '/api';
    }
  }

  /// Generic get endpoint
  /// @param {String} endIp : end of the Ip for a specific endpoint
  Future<dynamic> getApi(
    String endIp, {
    int version = 0,
    bool isPro = false,
    dynamic options,
  }) async {
    _setDioBaseUrl(version: version);
    final Response<dynamic> response =
        await dio.get(endIp, queryParameters: options);
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 404:
        return null;
      //throw const HttpException('Unauthorized');
      default:
        throw Exception('failed');
    }
  }

  /// Generic post endpoint
  /// @param {String} endIp : end of the Ip for a specific endpoint
  /// @param {Object} body : Data in the body of the request
  Future<dynamic> postApi(
    String endIp, {
    Object? body,
    int version = 0,
    bool isPro = false,
  }) async {
    _setDioBaseUrl(version: version);
    final Response<dynamic> response = await dio.post(endIp, data: body);
    switch (response.statusCode) {
      case 201:
        return response.data;
      case 401:
        throw const HttpException('Unauthorized');
      default:
        throw Exception('failed');
    }
  }

  /// Generic put endpoint
  /// @param {String} endIp : end of the Ip for a specific endpoint
  /// @param {Object} body : Data in the body of the request
  Future<dynamic> putApi(
    String endIp, {
    Object? body,
    int version = 0,
    bool isPro = false,
  }) async {
    _setDioBaseUrl(version: version);
    final Response<dynamic> response = await dio.put(endIp, data: body);
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 401:
        throw const HttpException('Unauthorized');
      default:
        throw Exception('failed');
    }
  }

  /// Generic patch endpoint
  /// @param {String} endIp : end of the Ip for a specific endpoint
  /// @param {Object} body : Data in the body of the request
  Future<dynamic> patchApi(
    String endIp, {
    Object? body,
    int version = 0,
    bool isPro = false,
  }) async {
    _setDioBaseUrl(version: version);
    final Response<dynamic> response = await dio.patch(endIp, data: body);
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 401:
        throw const HttpException('Unauthorized');
      default:
        throw Exception('failed');
    }
  }

  /// Generic put endpoint
  /// @param {String} endIp : end of the Ip for a specific endpoint
  Future<dynamic> deleteApi(
    String endIp, {
    int version = 0,
    bool isPro = false,
  }) async {
    _setDioBaseUrl(version: version);
    final Response<dynamic> response = await dio.delete(endIp);
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 401:
        throw const HttpException('Unauthorized');
      default:
        throw Exception('failed');
    }
  }
}
