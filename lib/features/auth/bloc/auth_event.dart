import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequested extends AuthEvent {
  const LoginRequested();
}

class AuthEmailChanged extends AuthEvent {
  const AuthEmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class AuthPasswordChanged extends AuthEvent {
  const AuthPasswordChanged(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}
