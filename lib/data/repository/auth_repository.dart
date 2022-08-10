import 'package:flutter_basic_base/data/models/user.dart';
import 'package:flutter_basic_base/data/network/api_exception.dart';
import 'package:flutter_basic_base/data/network/app_api.dart';
import 'package:flutter_basic_base/data/requests/login_request.dart';
import 'package:flutter_basic_base/injection/injector.dart';

class AuthRepository {
  static final AppApi api = injector<AppApi>();

  AuthRepository();

  static Future<User> login(LoginRequest request) async {
    try {
      final response = await api.login(request);
      return response.toModel();
    } catch (ex) {
      throw ApiException.error(ex);
    }
  }
}
