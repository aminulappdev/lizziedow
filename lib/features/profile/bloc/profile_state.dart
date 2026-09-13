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
  });

  final int? selectedMenuIndex;
  final ProfileUserData user;
  final List<ProfileMenuItemData> menuItems;

  ProfileState copyWith({
    int? selectedMenuIndex,
    ProfileUserData? user,
    List<ProfileMenuItemData>? menuItems,
  }) {
    return ProfileState(
      selectedMenuIndex: selectedMenuIndex ?? this.selectedMenuIndex,
      user: user ?? this.user,
      menuItems: menuItems ?? this.menuItems,
    );
  }

  @override
  List<Object?> get props => [selectedMenuIndex, user, menuItems];
}
