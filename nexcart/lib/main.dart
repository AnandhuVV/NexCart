import 'package:flutter/material.dart';
import 'package:nexcart/authentication/presentation/widgets/login.dart';
import 'package:nexcart/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root Widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const LoginWidget(),
    );
  }
}
