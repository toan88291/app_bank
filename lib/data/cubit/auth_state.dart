part of 'auth_cubit.dart';

abstract class AuthState{
  AuthState();
}

class Authorized extends AuthState{
  Authorized() : super();
}

class UnAuthorized extends AuthState{
  UnAuthorized() : super();
}


