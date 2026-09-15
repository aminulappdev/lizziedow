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

class AuthPasswordVisibilityToggled extends AuthEvent {
  const AuthPasswordVisibilityToggled();
}

class AuthConfirmPasswordVisibilityToggled extends AuthEvent {
  const AuthConfirmPasswordVisibilityToggled();
}

class AuthCookieConsentChanged extends AuthEvent {
  const AuthCookieConsentChanged(this.value);

  final bool value;

  @override
  List<Object?> get props => [value];
}

class AuthExplicitConsentChanged extends AuthEvent {
  const AuthExplicitConsentChanged(this.value);

  final bool value;

  @override
  List<Object?> get props => [value];
}

class AuthHealthDataConsentChanged extends AuthEvent {
  const AuthHealthDataConsentChanged(this.value);

  final bool value;

  @override
  List<Object?> get props => [value];
}

class AuthAllConsentsAccepted extends AuthEvent {
  const AuthAllConsentsAccepted();
}
