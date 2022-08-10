import 'package:bloc/bloc.dart';
import 'package:flutter_basic_base/data/network/network_extensions.dart';
import 'package:flutter_basic_base/data/repository/auth_repository.dart';
import 'package:flutter_basic_base/data/requests/login_request.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login(String userName, String pass) async {
    emit(LoginLoadingState());
    await Future.delayed(const Duration(milliseconds: 2000));
    await AuthRepository.login(
      LoginRequest(
        userName: userName,
        password: pass,
      ),
    ).easyCompose(
      (response) {
        emit(LoginSuccessState());
      },
      onError: (error) {
        emit(LoginErrorState());
      },
    );
  }
}
