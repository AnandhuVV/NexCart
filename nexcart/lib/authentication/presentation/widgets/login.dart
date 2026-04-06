import 'package:flutter/material.dart';
import 'package:nexcart/core/common_widgets/buttons.dart';
import 'package:nexcart/core/extensions/context_extension.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const LoginForm(),
    );
  }
}

//MARK: Login form
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Heading large", style: context.textStyle.headingLarge),
          Text("Heading Medium", style: context.textStyle.headingMedium),
          Text("Body large", style: context.textStyle.bodyLarge),
          Text("Body Medium", style: context.textStyle.bodyMedium),
          Text("Body Semibold", style: context.textStyle.bodySemibold),
          Text("Body Normal", style: context.textStyle.bodyNormal),
          Text("Body thin", style: context.textStyle.bodyThin),
        ],
      ),
    );

    // return Form(
    //   key: _formKey,
    //   child: Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: Column(
    //       spacing: 12,
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //         //Logo
    //         _appLogo(),

    //         //Username
    //         _loginFormField(context, "Username"),

    //         //Password
    //         _loginFormField(context, "Password"),

    //         SizedBox(height: 24),

    //         nexPrimaryButton(context: context, title: "Sign In"),

    //         SizedBox(height: 182),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget _loginFormField(BuildContext context, String title) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(title, style: TextStyle(fontWeight: .w500)),
        ),
        nexTextFormField(
          context: context,
          hintText: title,
          validator: (value) {
            return null;
          },
        ),
      ],
    );
  }

  Widget _appLogo() {
    return Column(
      spacing: .minPositive,
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: Image.asset('assets/images/app_logo_inside.png'),
        ),
        Text(
          "NexCart",
          style: TextStyle(
            color: context.colors.primaryAction,
            fontWeight: FontWeight.normal,
            fontSize: 32,
          ),
        ),
      ],
    );
  }
}
