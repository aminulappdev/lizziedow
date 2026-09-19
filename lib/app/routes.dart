import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/routes_name.dart';
import 'package:lizziedow/features/auth/bloc/auth_bloc.dart';
import 'package:lizziedow/features/auth/view/screen/forgot_password_page.dart';
import 'package:lizziedow/features/auth/view/screen/login_page.dart';
import 'package:lizziedow/features/auth/view/screen/set_password_page.dart';
import 'package:lizziedow/features/auth/view/screen/set_type_screen.dart';
import 'package:lizziedow/features/auth/view/screen/signup_page.dart';
import 'package:lizziedow/features/auth/view/screen/verify_email_page.dart';
import 'package:lizziedow/features/dashboard/view/screen/dashboard_screen.dart';
import 'package:lizziedow/features/onboarding/view/screen/onboarding_screen.dart';
import 'package:lizziedow/features/profile/view/screen/change_password_screen.dart';
import 'package:lizziedow/features/profile/view/screen/edit_profile_screen.dart';
import 'package:lizziedow/features/profile/view/screen/profile_info_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(create: (_) => AuthBloc(), child: const LoginPage()),
        );
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case RoutesName.verifyEmailScreen:
        final arguments = settings.arguments;
        final email = arguments is Map ? arguments['email'] as String? : null;
        final nextRoute = arguments is Map
            ? arguments['nextRoute'] as String?
            : null;

        return MaterialPageRoute(
          builder: (_) => VerifyEmailPage(
            email: email ?? '',
            nextRoute: nextRoute ?? RoutesName.loginScreen,
          ),
        );
      case RoutesName.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case RoutesName.setPasswordScreen:
        return MaterialPageRoute(builder: (_) => const SetPasswordPage());
      case RoutesName.setTypeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthBloc(),
            child: const SetTypeScreen(),
          ),
        );
      case RoutesName.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case RoutesName.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case RoutesName.profileInfoScreen:
        final arguments = settings.arguments;
        final header = arguments is Map ? arguments['header'] as String? : null;
        final data = arguments is Map ? arguments['data'] as String? : null;

        return MaterialPageRoute(
          builder: (_) => ProfileInfoScreen(
            header: header ?? '',
            data: data ?? '',
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
