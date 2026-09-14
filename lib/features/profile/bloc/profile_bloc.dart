import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/features/profile/bloc/profile_event.dart';
import 'package:lizziedow/features/profile/bloc/profile_state.dart';
import 'package:lizziedow/features/profile/repository/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({ProfileRepository profileRepository = const ProfileRepository()})
    : _profileRepository = profileRepository,
      super(const ProfileState()) {
    on<ProfileStartedEvent>(_onProfileStarted);
    on<ProfileMenuItemSelectedEvent>(_onProfileMenuItemSelected);
    on<ProfileCurrentPasswordVisibilityToggledEvent>(
      _onCurrentPasswordVisibilityToggled,
    );
    on<ProfileNewPasswordVisibilityToggledEvent>(
      _onNewPasswordVisibilityToggled,
    );
    on<ProfileConfirmPasswordVisibilityToggledEvent>(
      _onConfirmPasswordVisibilityToggled,
    );
  }

  final ProfileRepository _profileRepository;

  void _onProfileStarted(
    ProfileStartedEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(
      state.copyWith(
        user: _profileRepository.user,
        menuItems: _profileRepository.menuItems,
      ),
    );
  }

  void _onProfileMenuItemSelected(
    ProfileMenuItemSelectedEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(selectedMenuIndex: event.index));
  }

  void _onCurrentPasswordVisibilityToggled(
    ProfileCurrentPasswordVisibilityToggledEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(
      state.copyWith(
        isCurrentPasswordVisible: !state.isCurrentPasswordVisible,
      ),
    );
  }

  void _onNewPasswordVisibilityToggled(
    ProfileNewPasswordVisibilityToggledEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(
      state.copyWith(
        isNewPasswordVisible: !state.isNewPasswordVisible,
      ),
    );
  }

  void _onConfirmPasswordVisibilityToggled(
    ProfileConfirmPasswordVisibilityToggledEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(
      state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
      ),
    );
  }
}
