import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/context_extension.dart';

Widget nexPrimaryButton({
  required BuildContext context,
  required String title,
}) {
  return SizedBox(
    width: double.infinity,
    height: 54,
    child: TextButton(
      onPressed: () {},
      style: ButtonStyle(backgroundColor: .all(context.colors.primaryAction)),
      child: Text(title, style: TextStyle(color: context.colors.onPrimary)),
    ),
  );
}

Widget nexTextFormField({
  required BuildContext context,
  required String hintText,
  FormFieldValidator<String>? validator,
}) {
  return SizedBox(
    width: double.infinity,
    height: 54,
    child: TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: context.colors.secondaryAction,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    ),
  );
}