import 'package:equatable/equatable.dart';
import 'package:lizziedow/features/auth/model/user_model.dart';

enum AuthPostApiStatus { initial, loading, success, error }

class AuthState extends Equatable {
  const AuthState({
    this.email = '',
    this.password = '',
    this.postApiStatus = AuthPostApiStatus.initial,
    this.message = '',
    this.user,
  });

  final String email;
  final String password;
  final AuthPostApiStatus postApiStatus;
  final String message;
  final UserModel? user;

  AuthState copyWith({
    String? email,
    String? password,
    AuthPostApiStatus? postApiStatus,
    String? message,
    UserModel? user,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        postApiStatus,
        message,
        user,
      ];
}
