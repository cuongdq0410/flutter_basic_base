import 'package:bloc/bloc.dart';
import 'package:flutter_basic_base/data/repository/auth_repository.dart';
import 'package:flutter_basic_base/data/network/api_exception.dart';
import 'package:flutter_basic_base/data/requests/login_request.dart';
import 'package:flutter_basic_base/injection/injector.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login(String userName, String pass) async {
    try {
      emit(LoginLoadingState());
      await Future.delayed(const Duration(milliseconds: 2000));
      // await AuthRepository.login(
      //   LoginRequest(
      //     userName: userName,
      //     password: pass,
      //   ),
      // );
      emit(LoginSuccessState());
    } on ApiException catch (e) {
      emit(LoginErrorState());
    }
  }
}
