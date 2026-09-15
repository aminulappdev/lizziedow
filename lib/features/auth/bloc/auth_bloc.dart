import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/features/auth/bloc/auth_event.dart';
import 'package:lizziedow/features/auth/bloc/auth_state.dart';
import 'package:lizziedow/features/auth/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository(),
        super(const AuthState()) {
    on<AuthEmailChanged>(_onEmailChanged);
    on<AuthPasswordChanged>(_onPasswordChanged);
    on<LoginRequested>(_onLoginRequested);
    on<AuthPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<AuthConfirmPasswordVisibilityToggled>(
      _onConfirmPasswordVisibilityToggled,
    );
    on<AuthCookieConsentChanged>(_onCookieConsentChanged);
    on<AuthExplicitConsentChanged>(_onExplicitConsentChanged);
    on<AuthHealthDataConsentChanged>(_onHealthDataConsentChanged);
    on<AuthAllConsentsAccepted>(_onAllConsentsAccepted);
  }

  final AuthRepository _authRepository;

  void _onEmailChanged(
    AuthEmailChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
    AuthPasswordChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onPasswordVisibilityToggled(
    AuthPasswordVisibilityToggled event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onConfirmPasswordVisibilityToggled(
    AuthConfirmPasswordVisibilityToggled event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
      ),
    );
  }

  void _onCookieConsentChanged(
    AuthCookieConsentChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(hasCookieConsent: event.value));
  }

  void _onExplicitConsentChanged(
    AuthExplicitConsentChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(hasExplicitConsent: event.value));
  }

  void _onHealthDataConsentChanged(
    AuthHealthDataConsentChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(hasHealthDataConsent: event.value));
  }

  void _onAllConsentsAccepted(
    AuthAllConsentsAccepted event,
    Emitter<AuthState> emit,
  ) {
    emit(
      state.copyWith(
        hasCookieConsent: true,
        hasExplicitConsent: true,
        hasHealthDataConsent: true,
      ),
    );
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit, 
  ) async {
    emit(state.copyWith(postApiStatus: AuthPostApiStatus.loading));

    try {
      final user = await _authRepository.login(
        email: state.email,
        password: state.password,
      );
      emit(
        state.copyWith(
          postApiStatus: AuthPostApiStatus.success,
          message: 'Login Successfully',
          user: user,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          postApiStatus: AuthPostApiStatus.error,
          message: error.toString(),
        ),
      );
    }
  }
}
