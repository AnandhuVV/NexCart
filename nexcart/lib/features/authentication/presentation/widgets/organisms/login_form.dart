import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexcart/features/authentication/presentation/notifiers/auth_notifier.dart';
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
             context.go('/home');
          }
        },
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.localizeError(error)),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _appLogo(context),
            _loginFormField(
              context,
              context.loc.username,
              _usernameController,
              hintText: context.loc.enterYourUsername,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return context.loc.pleaseEnterYourUsername;
                }
                if (value.trim().length < 3) {
                  return context.loc.usernameMustBeAtLeast3Characters;
                }
                return null;
              },
            ),
            _loginFormField(
              context,
              context.loc.password,
              _passwordController,
              hintText: context.loc.enterYourPassword,
              obscureText: true,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return context.loc.pleaseEnterYourPassword;
                }
                if (value.trim().length < 6) {
                  return context.loc.passwordMustBeAtLeast6Characters;
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              title: context.loc.signIn,
              isLoading: authState.isLoading,
              onPressed: authState.isLoading ? null : _onSignIn,
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginFormField(
    BuildContext context,
    String title,
    TextEditingController controller, {
    required String hintText,
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
          hintText: hintText,
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
          context.loc.appName,
          style: context.textStyle.headingLarge.copyWith(
            color: context.colors.primaryAction,
          ),
        ),
      ],
    );
  }
}
