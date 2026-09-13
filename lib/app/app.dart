import 'package:flutter/material.dart';
import 'package:lizziedow/app/routes.dart';
import 'package:lizziedow/app/routes_name.dart';
import 'package:lizziedow/app/theme/my_theme.dart';

class LizzieDowApp extends StatelessWidget {
  const LizzieDowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LizzieDow',
      theme: MyTheme.getThemeData(isLight: true),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
