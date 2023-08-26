import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:simple_ecommerce/core/presentation/widget/custom_button.dart';
import 'package:sizer/sizer.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert(
      {super.key,
      required this.title,
      required this.message,
      this.icon,
      this.iconColor,
      this.action});
  final String title;
  final String message;
  final IconData? icon;
  final Color? iconColor;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(sizeMedium),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon ?? Icons.check_circle,
            color: iconColor ?? greenColor,
            size: 6.h,
          ),
          smallVerticalSpacing(),
          Text(
            title,
            style: dialogTitleTextStyle,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      content: Text(
        message,
        style: dialogMessageTextStyle,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: action ?? [const SingleButtonDialog()],
    );
  }
}
