part of 'auth_cubit.dart';

abstract class AuthState{

  String username;

  AuthState({this.username});

}

class Authorized extends AuthState{
  Authorized({String username}) : super(username: username);
}

class UnAuthorized extends AuthState{
  UnAuthorized() : super();
}


