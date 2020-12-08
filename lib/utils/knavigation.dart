
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KNavigation {
  static final KNavigation _shared = new KNavigation._internal();

  String text;
  factory KNavigation() {
    return _shared;
  }
  KNavigation._internal();

  GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  GlobalKey<ScaffoldState> mainContext = new GlobalKey<ScaffoldState>();
  CupertinoTabController tabController = CupertinoTabController();

  Future<dynamic> push(String routeName, {Object args}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: args);
  }

  pop() {
    if(navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop();
    }
  }
  Future<dynamic> replace(String routeName, {Object args}) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false, arguments: args);
  }
}