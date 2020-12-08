import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:king_bank/data/cubit/auth_cubit.dart';
import 'package:king_bank/generated/l10n.dart';
import 'package:king_bank/utils/knavigation.dart';
import 'package:king_bank/widgets/button_click.dart';
import 'package:king_bank/widgets/text_field_animation.dart';

class SignInPage extends StatefulWidget {
  static const ROUTE_NAME = 'SignInPage';
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin{
  static const TAG = 'SignInPage';
  GlobalKey<FormState> _formKey = GlobalKey(debugLabel: 'SignInPage');
  bool _isLoading = false;
  String phone, password;

  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();

  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 48,),
                  Text(
                    S.current.login,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black
                    ),
                  ),
                  FlutterLogo(
                    size: 112,
                  ),
                  SizedBox(height: 48,),
                  TextFieldAnimation(
                    'Phone',
                    myFocusNode: myFocusNode,
                    prefixIcon: Icon(Icons.phone, color: Color(0xffB2B3D2),),
                  ),
                  SizedBox(height: 24,),
                  TextFieldAnimation(
                    'PassWord',
                    myFocusNode: myFocusNode2,
                    prefixIcon: Icon(Icons.vpn_key, color: Color(0xffB2B3D2),),
                    suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffB2B3D2),),
                  ),
                  SizedBox(height: 16,),
                  ButtonClick(
                    isLoading: _isLoading,
                    title: 'Login',
                    titleStyle: TextStyle(
                      color: Colors.white
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        _formKey.currentState.save();
                        context.read<AuthCubit>().signIn('',phone, password).then((value) {
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      }
                    },
                  ),
                  ButtonClick(
                    autoWidth: true,
                    title: 'Register',
                    titleStyle: TextStyle(
                        color: Colors.white
                    ),
                    onPressed: () => KNavigation().push('/sign_up'),
                  ),
                ],
              ),
            )
        ),
    );
  }
}
