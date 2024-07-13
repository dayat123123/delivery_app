import 'dart:convert';
import 'dart:io';

import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/utils/storage_helper.dart';
import 'package:delivery_app/shared/misc/storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum Method {
  post,
  postjson,
  postfile,
  get,
  getbytes,
  put,
  delete,
  patch,
  download
}

class DioClient {
  late Dio _dio;
  final StorageHelper storageHelper;
  DioClient(this.storageHelper) {
    _dio = Dio();
    _dio.options.connectTimeout = const Duration(milliseconds: 60000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 53000);
    _dio.interceptors.add(headerInterceptor(storageHelper));
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseBody: kDebugMode,
        responseHeader: false,
        error: kDebugMode,
        compact: kDebugMode,
        maxWidth: 90));
  }

  Future<Result<dynamic>> create(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;
    try {
      switch (method) {
        case Method.post:
          response = await _dio.post(
            url,
            data: params,
            options: Options(contentType: Headers.formUrlEncodedContentType),
          );
        case Method.postjson:
          response = await _dio.post(url,
              data: json.encode(params),
              options: Options(contentType: Headers.jsonContentType));
          break;
        case Method.postfile:
          response = await _dio.post(url,
              data: FormData.fromMap(params!),
              options:
                  Options(headers: {'Content-Type': 'multipart/form-data'}));
          break;
        case Method.delete:
          response = await _dio.delete(url);
          break;
        case Method.download:
          response = await _dio.download(url, '/excel.xls');
          break;
        case Method.patch:
          response = await _dio.patch(url, data: params);
          break;
        case Method.put:
          response = await _dio.put(url, data: params);
          break;
        case Method.getbytes:
          response = await _dio.get(url,
              options: Options(
                  contentType: Headers.jsonContentType,
                  responseType: ResponseType.bytes));
          if (response.statusCode == HttpStatus.ok) {
            return Result.success(response.data);
          }
        default:
          response = await _dio.get(url);
          break;
      }

      switch (response.statusCode) {
        case HttpStatus.ok:
          return Result.success(response.data);
        case HttpStatus.unauthorized:
          return Result.failed("Unauthorized : ${response.data["message"]}");
        case HttpStatus.badRequest:
          return Result.failed("Bad Request : ${response.data["message"]}");
        case HttpStatus.forbidden:
          return Result.failed("Forbidden : ${response.data["message"]}");
        case HttpStatus.notFound:
          return Result.failed("Not Found : ${response.data["message"]}");
        case HttpStatus.conflict:
          return Result.failed("Conflict : ${response.data["message"]}");
        case HttpStatus.internalServerError:
          return const Result.failed("Internal Server Error");
        default:
          return const Result.failed("Something Wrong");
      }
    } on SocketException {
      return const Result.failed("No internet access");
    } on FormatException {
      return const Result.failed("Bad response format");
    } on DioException catch (e) {
      return Result.failed("Error : ${e.message}");
    }
  }

  Interceptor headerInterceptor(StorageHelper storageHelper) {
    return InterceptorsWrapper(onRequest:
        (RequestOptions request, RequestInterceptorHandler handler) async {
      final storageToken = await storageHelper.read(StorageKeys.token);
      if (storageToken.isNotEmpty) {
        request.headers.addAll({
          "x-token": storageToken,
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*'
        });
      }

      request.headers
          .addAll({"Access-Control-Allow-Origin": "*", 'Accept': '*/*'});
      return handler.next(request);
    });
  }
}
