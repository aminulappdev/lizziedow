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
