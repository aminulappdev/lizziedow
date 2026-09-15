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
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.hasCookieConsent = false,
    this.hasExplicitConsent = false,
    this.hasHealthDataConsent = false,
  });

  final String email;
  final String password;
  final AuthPostApiStatus postApiStatus;
  final String message;
  final UserModel? user;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final bool hasCookieConsent;
  final bool hasExplicitConsent;
  final bool hasHealthDataConsent;

  AuthState copyWith({
    String? email,
    String? password,
    AuthPostApiStatus? postApiStatus,
    String? message,
    UserModel? user,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    bool? hasCookieConsent,
    bool? hasExplicitConsent,
    bool? hasHealthDataConsent,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      message: message ?? this.message,
      user: user ?? this.user,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      hasCookieConsent: hasCookieConsent ?? this.hasCookieConsent,
      hasExplicitConsent: hasExplicitConsent ?? this.hasExplicitConsent,
      hasHealthDataConsent:
          hasHealthDataConsent ?? this.hasHealthDataConsent,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        postApiStatus,
        message,
        user,
        isPasswordVisible,
        isConfirmPasswordVisible,
        hasCookieConsent,
        hasExplicitConsent,
        hasHealthDataConsent,
      ];
}
