import 'package:equatable/equatable.dart';
import 'package:simple_ecommerce/featured/login/data/model/login_model.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  LoginModel? data;
  LoginSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}

class LoginFailed extends LoginState {
  String? msg;
  LoginFailed({required this.msg});

  @override
  List<Object?> get props => [msg];
}
