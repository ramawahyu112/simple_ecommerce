import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends RegisterState {
  String? msg;
  RegisterSuccess({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class RegisterFailed extends RegisterState {
  String? msg;
  RegisterFailed({required this.msg});

  @override
  List<Object?> get props => [msg];
}
