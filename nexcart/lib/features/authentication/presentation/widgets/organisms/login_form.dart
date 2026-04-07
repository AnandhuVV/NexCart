import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexcart/features/authentication/presentation/view_models/auth_notifier.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/primary_button.dart';
import 'package:nexcart/core/ui/atoms/text_field.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignIn() {
    if (_formKey.currentState!.validate()) {
      ref.read(authProvider.notifier).signIn(
            _usernameController.text.trim(),
            _passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    // Listen for errors and show snackbar
    ref.listen(authProvider, (previous, next) {
      next.whenOrNull(
        data: (data) {
          if (data != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Logged in successfully!"),
                backgroundColor: context.colors.success,
              ),
            );
          }
        },
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: context.colors.error,
            ),
          );
        },
      );
    });

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _appLogo(context),
            _loginFormField(
              context,
              "Username",
              _usernameController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your username';
                }
                if (value.trim().length < 3) {
                  return 'Username must be at least 3 characters';
                }
                return null;
              },
            ),
            _loginFormField(
              context,
              "Password",
              _passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your password';
                }
                if (value.trim().length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              title: "Sign In",
              isLoading: authState.isLoading,
              onPressed: authState.isLoading ? null : _onSignIn,
            ),
            const SizedBox(height: 140),
          ],
        ),
      ),
    );
  }

  Widget _loginFormField(
    BuildContext context,
    String title,
    TextEditingController controller, {
    bool obscureText = false,
    String? Function(String?)? validator,
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
          controller: controller,
          hintText: "Enter your $title",
          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }

  Widget _appLogo(BuildContext context) {
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