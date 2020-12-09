import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:king_bank/data/cubit/auth_cubit.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TAG = 'HomePage';

  @override
  void initState() {
    super.initState();
    developer.log('initState', name: TAG);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context,data) {
        developer.log('${data.username}',name: TAG);
        return Center(
          child: Text('Home Page'),
        );
      },
      buildWhen: (previous, current) {
        return previous.runtimeType != current.runtimeType;
      },
    );
  }
}
