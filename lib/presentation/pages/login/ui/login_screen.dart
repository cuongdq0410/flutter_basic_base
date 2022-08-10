import 'package:flutter/material.dart';
import 'package:flutter_basic_base/base/base_screen.dart';
import 'package:flutter_basic_base/localization/localization_util.dart';
import 'package:flutter_basic_base/presentation/navigation/route_define.dart';
import 'package:flutter_basic_base/utils/dialog_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginCubit> {
  @override
  Widget buildContent(BuildContext context) {
    return BlocListener(
      bloc: cubit,
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginLoadingState:
            DialogUtils.showLoading(context: context);
            break;
          case LoginSuccessState:
            DialogUtils.hideLoading(context: context);
            replaceScreen(RouteDefine.homeScreen.name);
            break;
          case LoginErrorState:
            DialogUtils.hideLoading(context: context);
            DialogUtils.showAlert(context, message: 'Something went wrong!');
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.login.tr(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextField(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.face),
                    hintText: LocaleKeys.enterUserName.tr(),
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (email) {},
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextField(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.password),
                    hintText: LocaleKeys.enterPassword.tr(),
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (password) {},
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              InkWell(
                onTap: () {
                  cubit.login('abc', '124');
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(LocaleKeys.login.tr()),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (Localization.currentLanguage == Languages.vi) {
              Localization.changeAppLanguage(context, Languages.en);
            } else {
              Localization.changeAppLanguage(context, Languages.vi);
            }
            print("Result : ${Localization.currentLanguage}");
          },
          tooltip: LocaleKeys.changeLanguage.tr(),
          child: const Icon(Icons.change_circle),
        ),
      ),
    );
  }

  @override
  afterBuild() {}
}
