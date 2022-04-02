import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? child;
  final double? height;
  final Function? onPressed;
  final String? labelText;
  final bool isSuffixVisible;
  final String? Function(String?)? validator;
  final bool obscureTextPassword;
  final bool isValidate;
  final dynamic keyboardType;
  final dynamic actionType;
  const CustomTextField({
    this.obscureTextPassword = false,
    Key? key,
    this.isSuffixVisible = false,
    this.child,
    this.height = 50.0,
    this.onPressed,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.isValidate = false,
    this.controller,
    this.keyboardType,
    this.actionType,
  }) : super(key: key);

  @override
  CustomTextFieldPassword createState() => CustomTextFieldPassword();
}

class CustomTextFieldPassword extends State<CustomTextField> {
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13),
      child: TextFormField(
        style: const TextStyle(fontSize: 14),
        textInputAction: widget.actionType,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obscureTextPassword,
        autofocus: true,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: AppColors.red, width: 1.0),
          ),
          labelText: widget.labelText,
          contentPadding: const EdgeInsets.all(17),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon != null && widget.isSuffixVisible
              ? widget.suffixIcon
              : const Opacity(opacity: 0, child: null),
        ),
      ),
    );
  }
}
