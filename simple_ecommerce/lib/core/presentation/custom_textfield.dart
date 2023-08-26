import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? errorMessage;
  final bool isError;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const CustomTextField({
    required this.labelText,
    required this.controller,
    this.errorMessage,
    this.isError = false,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;
  final borderColor = blackColor;
  final errorColor = redColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: normalText,
        ),
        const SizedBox(height: sizeSmall),
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _isObscured : false,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    child: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: blackColor,
                    ),
                  )
                : widget.suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
                vertical: sizeSmall, horizontal: sizeSmall),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorColor),
            ),
            errorText: widget.isError ? widget.errorMessage : null,
          ),
        ),
      ],
    );
  }
}
