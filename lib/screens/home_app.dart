import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:king_bank/data/cubit/auth_cubit.dart';
import 'dart:developer' as developer;

import 'authorization/sign_in/sign_in_page.dart';
import 'authorized/main_app.dart';

class HomeApp extends StatefulWidget {
  static const ROUTE_NAME = 'HomeApp';
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  static const TAG = 'HomeApp';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        debugPrint('state: $state');
        if (state is Authorized) {
          return MainApp();
        } else {
          return SignInPage();
        }
      },
      buildWhen: (previous, current) {
        return previous.runtimeType != current.runtimeType;
      },
    );
  }
}
