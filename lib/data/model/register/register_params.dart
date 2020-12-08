import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

class RegisterParams {
  String name;
  String email;
  String phone;
  String password;
  String confirmPass;
  String confirm;


  RegisterParams({this.name,this.email,this.phone,this.password,this.confirmPass,this.confirm});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['password_confirmation'] = this.confirmPass;
    data['about_me'] = this.confirm;
    data['device_token'] = 'device_token';
    return data;
  }
}