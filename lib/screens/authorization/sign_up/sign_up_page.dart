import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:king_bank/data/cubit/auth_cubit.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _formKey = GlobalKey(debugLabel: 'SignInPage');
  bool _isLoading = false;
  String phone, password, name, email, confirm, confirmPass;

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
                FlutterLogo(
                  size: 112,
                ),
                SizedBox(height: 48,),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    hintText: 'Phone',
                    labelText: 'Phone',
                    filled: true,
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Input Invalid!';
                    return null;
                  },
                  enabled: !_isLoading,
                  onSaved: (value) {
                    phone = value;
                  },
                ),
                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Password',
                      labelText: 'Password',
                      filled: true,
                      border: UnderlineInputBorder()
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) return 'Input Invalid!';
                    return null;
                  },
                  enabled: !_isLoading,
                  onSaved: (value) {
                    password = value;
                  },
                ),
                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    hintText: 'Confirm Pass',
                    labelText: 'Confirm Pass',
                    filled: true,
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Input Invalid!';
                    return null;
                  },
                  enabled: !_isLoading,
                  onSaved: (value) {
                    confirmPass = value;
                  },
                ),
                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    hintText: 'Name',
                    labelText: 'Name',
                    filled: true,
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Input Invalid!';
                    return null;
                  },
                  enabled: !_isLoading,
                  onSaved: (value) {
                    name = value;
                  },
                ),
                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    hintText: 'Email',
                    labelText: 'Email',
                    filled: true,
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Input Invalid!';
                    return null;
                  },
                  enabled: !_isLoading,
                  onSaved: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 16,),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    hintText: 'Confirm',
                    labelText: 'Confirm',
                    filled: true,
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) return 'Input Invalid!';
                    return null;
                  },
                  enabled: !_isLoading,
                  onSaved: (value) {
                    confirm = value;
                  },
                ),
                SizedBox(height: 16,),
                FlatButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: 64,
                      vertical: 12
                  ),
                  shape: StadiumBorder(),
                  color: Colors.blue,
                  disabledColor: Colors.blue,
                  onPressed: !_isLoading ?  () {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      _formKey.currentState.save();
                      context.read<AuthCubit>().signUp().then((value) {
                        setState(() {
                          _isLoading = false;
                        });
                      });
                    }
                  } : null,
                  child: _isLoading ? CupertinoActivityIndicator() : Text('Sign up'),
                )
              ],
            ),
          )
      ),
    );
  }
}
