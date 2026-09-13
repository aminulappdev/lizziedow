import 'package:equatable/equatable.dart';
import 'package:lizziedow/features/dashboard/view/widgets/nav_bar_item.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.currentIndex = 2,
    this.navItems = const [],
  });

  final int currentIndex;
  final List<DashboardNavItem> navItems;

  DashboardState copyWith({
    int? currentIndex,
    List<DashboardNavItem>? navItems,
  }) {
    return DashboardState(
      currentIndex: currentIndex ?? this.currentIndex,
      navItems: navItems ?? this.navItems,
    );
  }

  @override
  List<Object?> get props => [currentIndex, navItems];
}
