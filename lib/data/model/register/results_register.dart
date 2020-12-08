import 'register_model.dart';

class ResultsRegister {
  final RegisterModel data;
  final String message;
  final int code;

  ResultsRegister(this.data, this.message, this.code);

  ResultsRegister.fromJson(Map<String, dynamic> json)
      : data = json['data'] != null ? RegisterModel.fromJson(json['data']) : null,
        message = json["message"],
        code = json["code"];
}