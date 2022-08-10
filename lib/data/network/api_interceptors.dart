import 'package:dio/dio.dart';
import 'package:flutter_basic_base/data/storage/session_utils.dart';
import 'package:flutter_basic_base/injection/injector.dart';

import 'app_api.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = SessionUtils.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401) {
      final result = await refreshToken();
      if (result) {
        return handler.resolve(await _retry(response.requestOptions));
      }
    }
    super.onResponse(response, handler);
  }

  Future<bool> refreshToken() async {
    final String refreshToken = SessionUtils.getRefreshToken() ?? '';
    final response = await injector.get<AppApi>().getRefreshToken(refreshToken);
    if (response.statusCode == 201) {
      SessionUtils.saveAccessToken(response.data);
      return true;
    } else {
      SessionUtils.clearSession();
      return false;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return injector.get<Dio>().request<dynamic>(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options,
        );
  }
}
