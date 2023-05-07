import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class ErrorSignUpState extends AuthState {
  String errorMessage;

  ErrorSignUpState(this.errorMessage);
}

class SignUpState extends AuthState {}
