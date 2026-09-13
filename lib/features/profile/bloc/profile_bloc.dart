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
}
