import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

void main() {
  runApp(const TiaJoBankApp());
}

class TiaJoBankApp extends StatelessWidget {
  const TiaJoBankApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TíaJo Bank',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/splash',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}