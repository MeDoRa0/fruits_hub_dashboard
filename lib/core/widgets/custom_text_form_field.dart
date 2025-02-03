import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.suffixIcon,
      this.onSaved,
      this.obscureText = false});
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return 'الرجاء إدخال $hintText';
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        hintText: hintText,
        hintStyle: AppTextStyle.font13Bold.copyWith(
          color: Color(0xFF949D9E),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
