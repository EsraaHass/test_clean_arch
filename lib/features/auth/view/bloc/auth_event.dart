import 'package:equatable/equatable.dart';
import 'package:test_clean_architecture/features/auth/data/models/user_model.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthEvent {
  UserModel model;

  String pass;

  SignUpEvent(this.model, this.pass);
}

class SignInEvent extends AuthEvent {
  String email;

  String pass;

  SignInEvent(this.email, this.pass);
}
