import 'package:lizziedow/features/dashboard/view/widgets/nav_bar_item.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class DashboardRepository {
  const DashboardRepository();

  List<DashboardNavItem> get navItems => [
    DashboardNavItem(icon: Assets.images.fileNote03.keyName, label: 'Planner'),
    DashboardNavItem(icon: Assets.images.fileNote02.keyName, label: 'Results'),
    DashboardNavItem(icon: Assets.images.home.keyName, label: 'Home'),
    DashboardNavItem(icon: Assets.images.news.keyName, label: 'Documents'),
    DashboardNavItem(icon: Assets.images.person02.keyName, label: 'Profile'),
  ];
}
