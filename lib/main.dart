import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application.dart';
import 'common/app_session.dart';
import 'constrants/preference_key.dart';
import 'data/cubit/auth_cubit.dart';
import 'data/repository/app_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSession().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppRepository authRepository = AppRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
              AppSession().isUserLogin() ? Authorized() : UnAuthorized(),
              authRepository
          ),
        ),
      ],
      child: Application(),
    );
  }
}

