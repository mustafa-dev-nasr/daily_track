import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadiusBottomLeft;
  final double? borderRadiusBottomRight;
  final double? borderRadiusTopLeft;
  final double? borderRadiustopRight;
  final double? vertcalPadding;
  final double? horzontalPadding;
  final double? bottonWidth;
  final double? bouttonHeight;
  final Color? backgroundColor;

  final void Function()? onPressed;
  final String buttonText;
  final TextStyle textStyle;

  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.textStyle,
    this.vertcalPadding,
    this.horzontalPadding,
    this.bottonWidth,
    this.bouttonHeight,
    this.backgroundColor,
    this.borderRadiusBottomLeft,
    this.borderRadiusBottomRight,
    this.borderRadiusTopLeft,
    this.borderRadiustopRight,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  borderRadiusBottomLeft ?? 16,
                ),
                bottomRight: Radius.circular(
                  borderRadiusBottomRight ?? 16,
                ),
                topLeft: Radius.circular(
                  borderRadiusTopLeft ?? 16,
                ),
                topRight: Radius.circular(
                  borderRadiustopRight ?? 16,
                ),
              ),
            ),
          ),
          // backgroundColor:
          backgroundColor: WidgetStateProperty.all<Color>(
            backgroundColor ?? prymary,
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
                horizontal: horzontalPadding?.w ?? 12.w,
                vertical: horzontalPadding?.h ?? 14.h),
          ),
          fixedSize: WidgetStateProperty.all(Size(
              bottonWidth?.w ?? double.maxFinite, bouttonHeight?.h ?? 55.h))),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
