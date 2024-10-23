import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:finance_house_test/model/error_response.dart';
import 'package:flutter/foundation.dart';

import '../../core/constant.dart';

import 'dio_exception.dart';

class DioSetting {
  final Dio dio;
  final CookieJar cookieJar = CookieJar();

  DioSetting(this.dio) {
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true));
    dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<Response> get(
      {required String subUrl,
      String? token,
      String? url,
      Map<String, dynamic> queryParameters = const <String, dynamic>{}}) async {
    queryParameters['api_key'] = apiKey;
    try {
      Response response = await dio.get(url ?? "$baseUrl/$subUrl",
          queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (kDebugMode) {
        print(errorMessage);
      }
      return Response(
          data: DioExceptions.fromDioError(e).getCustomResponse(),
          requestOptions: RequestOptions());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return Response<ErrorResponse>(
          data: ErrorResponse(
              statusCode: -100, statusMessage: "server error", success: false),
          requestOptions: RequestOptions());
    }
  }
}
