import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:king_bank/common/app_session.dart';
import 'package:king_bank/constrants/preference_key.dart';
import 'package:king_bank/data/model/login/login_params.dart';
import 'package:king_bank/data/model/register/register_params.dart';
import 'package:king_bank/data/model/register/results_register.dart';
import 'package:king_bank/data/repository/repositories.dart';
import 'package:king_bank/utils/knavigation.dart';
part 'auth_state.dart';


class AuthCubit extends Cubit<AuthState>{
  AppRepository _appRepository;

  AuthCubit(state, this._appRepository) : super(state);

  Future<void> signIn(String device_token, String password, String phone) async {
    final resultLogin = await _appRepository.signIn(
        LoginParams(
          device_token: '',
          phone: phone,
          password: password
        ).toJson()
    );
    if (resultLogin.code == 200) {
      AppSession().prefs.setString(PreferenceKey.TOKEN, resultLogin.data.token);
      emit(Authorized());
    }
  }

  Future<void> signUp() async {
    ResultsRegister resultLogin = await _appRepository.signUp(
        RegisterParams(
          password: "12345",
          phone: "0973939180",
          name: "toan",
          email: "wapthai@gmail.com",
          confirm: "abc",
          confirmPass: "12345"
        ).toJson()
    );
    if (resultLogin.code == 200) {
      KNavigation().pop();
    }
  }

  Future updateInfo() async {
    // code
  }

  void logout() {
    if (state is Authorized) {
      emit(UnAuthorized());
    }
  }
}