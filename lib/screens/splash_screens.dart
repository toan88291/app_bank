import 'package:flutter/material.dart';
import 'package:king_bank/utils/knavigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration(seconds: 2), () {
      KNavigation().push('/home_app');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: FlutterLogo(
         size: 50,
      ),
    );
  }
}
