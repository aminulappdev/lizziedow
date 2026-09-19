import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class ProfileUserData extends Equatable {
  const ProfileUserData({
    required this.name,
    required this.email,
    required this.initials,
  });

  final String name;
  final String email;
  final String initials;

  @override
  List<Object?> get props => [name, email, initials];
}

class ProfileMenuItemData extends Equatable {
  const ProfileMenuItemData({
    required this.title,
    required this.icon,
    this.isDestructive = false,
  });

  final String title;
  final String icon;
  final bool isDestructive;

  @override
  List<Object?> get props => [title, icon, isDestructive];
}
