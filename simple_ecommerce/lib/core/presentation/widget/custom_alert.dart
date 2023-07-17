import 'package:flutter/material.dart';
import 'package:simple_ecommerce/core/core.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert(
      {super.key, required this.title, required this.message, this.onOk, this.buttonText});
  final String title;
  final String message;
  final String? buttonText;
  final Function()? onOk;

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
            Icons.check_circle,
            color: greenColor,
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
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(30.w, 2.h),
              backgroundColor: greenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(sizeMedium),
              ),
            ),
            onPressed: () => onOk ?? Get.back(),
            child: Text(
              buttonText ?? "OK",
              style: dialogButtonTextStyle,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ))
      ],
    );
  }
}
