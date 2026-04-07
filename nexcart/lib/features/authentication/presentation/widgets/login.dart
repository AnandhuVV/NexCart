import 'package:flutter/material.dart';
import 'package:nexcart/features/authentication/presentation/widgets/organisms/login_form.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const LoginForm(),
    );
  }
}
