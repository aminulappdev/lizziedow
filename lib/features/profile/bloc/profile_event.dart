import 'package:equatable/equatable.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileStartedEvent extends ProfileEvent {
  const ProfileStartedEvent();
}

class ProfileMenuItemSelectedEvent extends ProfileEvent {
  const ProfileMenuItemSelectedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class ProfileCurrentPasswordVisibilityToggledEvent extends ProfileEvent {
  const ProfileCurrentPasswordVisibilityToggledEvent();
}

class ProfileNewPasswordVisibilityToggledEvent extends ProfileEvent {
  const ProfileNewPasswordVisibilityToggledEvent();
}

class ProfileConfirmPasswordVisibilityToggledEvent extends ProfileEvent {
  const ProfileConfirmPasswordVisibilityToggledEvent();
}
