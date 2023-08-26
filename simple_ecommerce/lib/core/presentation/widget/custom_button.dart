import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      this.height,
      this.width,
      required this.onPressed,
      this.buttonRadius,
      this.isRounded = true,
      required this.child,
      this.color = orangeColor});
  final double? height;
  final double? width;
  final Function() onPressed;
  final double? buttonRadius;
  final bool? isRounded;
  final Widget child;
  final Color color;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 100.w,
      height: widget.height ?? 5.h,
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              shape: widget.isRounded == true
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.buttonRadius ?? 18),
                    )
                  : null),
          child: widget.child),
    );
  }
}

class SingleButtonDialog extends StatelessWidget {
  const SingleButtonDialog(
      {super.key, this.buttonText, this.onOk, this.buttonColor});
  final String? buttonText;
  final void Function()? onOk;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(30.w, 2.h),
          backgroundColor: buttonColor ?? greenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(sizeMedium),
          ),
        ),
        onPressed: onOk ?? () => Get.back(),
        child: Text(
          buttonText ?? "OK",
          style: dialogButtonTextStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
