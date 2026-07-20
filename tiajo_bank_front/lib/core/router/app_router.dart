import 'package:flutter/material.dart';
import '../../presentation/views/splash/splash_view.dart';
import '../../presentation/views/school/school_search_view.dart';
import '../../presentation/views/auth/login_view.dart';
import '../../presentation/views/dashboard/dashboard_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashView());
      case '/school-search':
        return MaterialPageRoute(builder: (_) => const SchoolSearchView());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginView(), settings: settings);
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text('Ruta no encontrada'))),
        );
    }
  }
}