import 'package:daily_track/core/helpers/extensions/app_navigotion.dart';
import 'package:daily_track/core/theming/app_colors.dart';
import 'package:daily_track/core/theming/app_text_styles.dart';
import 'package:daily_track/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/route.dart';

class EndAddMember extends StatelessWidget {
  const EndAddMember({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextButton(
            borderRadiusBottomLeft: 20,
            borderRadiusBottomRight: 20,
            borderRadiusTopLeft: 8,
            borderRadiustopRight: 20,
            backgroundColor: purple4,
            onPressed: onTap,
            buttonText: "save",
            textStyle: AppTextStyles.font20WhiteBold),
        20.verticalSpace,
        TextButton(
            onPressed: () {
              context.pushNamedAndRemoveUntil(
                Routes.homeScreen,
                (Route<dynamic> route) => false,
              );
            },
            child: Text("skip", style: AppTextStyles.font16LightblueMedium)),
      ],
    );
  }
}
