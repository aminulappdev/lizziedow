import 'package:equatable/equatable.dart';
import 'package:lizziedow/features/profile/model/profile_model.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.selectedMenuIndex,
    this.user = const ProfileUserData(
      name: '',
      email: '',
      initials: '',
    ),
    this.menuItems = const [],
    this.isCurrentPasswordVisible = false,
    this.isNewPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
  });

  final int? selectedMenuIndex;
  final ProfileUserData user;
  final List<ProfileMenuItemData> menuItems;
  final bool isCurrentPasswordVisible;
  final bool isNewPasswordVisible;
  final bool isConfirmPasswordVisible;

  ProfileState copyWith({
    int? selectedMenuIndex,
    ProfileUserData? user,
    List<ProfileMenuItemData>? menuItems,
    bool? isCurrentPasswordVisible,
    bool? isNewPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return ProfileState(
      selectedMenuIndex: selectedMenuIndex ?? this.selectedMenuIndex,
      user: user ?? this.user,
      menuItems: menuItems ?? this.menuItems,
      isCurrentPasswordVisible:
          isCurrentPasswordVisible ?? this.isCurrentPasswordVisible,
      isNewPasswordVisible:
          isNewPasswordVisible ?? this.isNewPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
    selectedMenuIndex,
    user,
    menuItems,
    isCurrentPasswordVisible,
    isNewPasswordVisible,
    isConfirmPasswordVisible,
  ];
}
