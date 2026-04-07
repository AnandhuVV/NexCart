import 'package:flutter/material.dart';
import 'package:nexcart/authentication/presentation/view_models/auth_notifier.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/primary_button.dart';
import 'package:nexcart/core/ui/atoms/text_field.dart';

class LoginForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Logo
            _appLogo(),

            //Username
            _loginFormField(context, "Username"),

            //Password
            _loginFormField(context, "Password", obscureText: true),

            SizedBox(height: 24),

            PrimaryButton(title: "Sign In", onPressed: () {}, isLoading: false),

            SizedBox(height: 140),
          ],
        ),
      ),
    );
  }

  Widget _loginFormField(
    BuildContext context,
    String title, {
    bool obscureText = false,
  }) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(title, style: context.textStyle.bodyMedium),
        ),
        NexTextField(
          obscureText ? AutofillHints.password : AutofillHints.username,
          hintText: "Enter your $title",
          validator: (value) {
            // Simple validation: field must not be empty
            if (title == "Username" && (value == null || value.isEmpty)) {
              return 'Please enter your username';
            }
            if (title == "Password" && (value == null || value.isEmpty)) {
              return 'Please enter your password';
            }
            return null; // Return null if the input is valid
          },
          obscureText: obscureText,
        ),
      ],
    );
  }

  Widget _appLogo() {
    return Column(
      spacing: 0,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Image.asset('assets/images/app_logo_inside.png'),
        ),
        Text(
          "NexCart",
          style: context.textStyle.headingLarge.copyWith(
            color: context.colors.primaryAction,
          ),
        ),
      ],
    );
  }
}
