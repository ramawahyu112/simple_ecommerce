import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      this.height,
      this.width,
      this.onPressed,
      this.buttonRadius,
      this.isRounded = true,
      required this.child,
      this.color = orangeColor});
  final double? height;
  final double? width;
  final Function()? onPressed;
  final double? buttonRadius;
  final bool? isRounded;
  final Widget child;
  final Color? color;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              shape: widget.isRounded == true
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.buttonRadius ?? 18))
                  : null),
          child: widget.child),
    );
  }
}
