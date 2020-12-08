import 'package:flutter/material.dart';
import 'package:king_bank/screens/authorization/sign_in/sign_in_page.dart';
import 'package:king_bank/screens/authorization/sign_up/sign_up_page.dart';
import 'package:king_bank/screens/authorized/main_app.dart';
import 'package:king_bank/screens/home_app.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case  '/sign_in':
        return MaterialPageRoute(
            builder: (context) => SignInPage(),
            settings: settings
        );
      case  '/sign_up':
        return MaterialPageRoute(
            builder: (context) => SignUpPage(),
            settings: settings
        );
      case '/main_app':
        return MaterialPageRoute(
            builder: (context) => MainApp(),
            settings: settings
        );
      case '/home_app':
        return MaterialPageRoute(
            builder: (context) => HomeApp(),
            settings: settings
        );

    }
  }
}

