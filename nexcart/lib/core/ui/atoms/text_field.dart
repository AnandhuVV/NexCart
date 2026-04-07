import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/theme/theme_extension.dart';

class NexTextField extends StatelessWidget {
  const NexTextField(String s, {
      super.key,
      required this.hintText,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
    });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    // We grab the text styles from the theme extension to keep it atomic
    final textStyles = Theme.of(context).extension<NexTextStyles>()!;

    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: textStyles.bodyMedium, // User's input text style
      
      // Auto-validate only after the user has interacted with the field once
      autovalidateMode: AutovalidateMode.onUserInteraction,
      
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyles.bodyMedium.copyWith(color: context.colors.textSecondary),
        filled: true,
        fillColor: context.colors.surface,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        
        // Padding inside the text field
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        
        // Default border (Idle state)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(color: context.colors.surfaceTint),
        ),
        
        // Focused border (When user is typing)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(color: context.colors.primaryAction, width: 1.5),
        ),
        
        // Error border (When validator returns a string)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(color: context.colors.error, width: 1.5),
        ),
        
        // Focused Error border (When user clicks back into a field with an error)
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(color: context.colors.error, width: 2),
        ),
        
        // Error text styling
        errorStyle: textStyles.bodyThin.copyWith(
          color: context.colors.error,
          fontWeight: FontWeight.w500, // Make error slightly bolder for readability
        ),
      ),
    );
  }
}