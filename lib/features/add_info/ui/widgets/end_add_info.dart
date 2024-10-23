import 'package:daily_track/core/helpers/extensions/app_navigotion.dart';
import 'package:daily_track/core/theming/app_colors.dart';
import 'package:daily_track/core/theming/app_text_styles.dart';
import 'package:daily_track/core/widgets/app_text_button.dart';
import 'package:daily_track/features/onboarding/ui/screens/onboarding_screen.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 250.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            height: 50,
            child: AppTextButton(
                backgroundColor: gray,
                onPressed: () {
                    context.pushReplacementNamed(Routes.homeScreen);
                },
                buttonText: "تخطي",
                textStyle: AppTextStyles.font20WhiteBold),
          ),
          SizedBox(
            width: 120,
            height: 50,
            child: AppTextButton(
                backgroundColor: purple4,
                onPressed: onTap,
                buttonText: "حفظ",
                textStyle: AppTextStyles.font20WhiteBold),
          ),
        ],
      ),
    );
  }
}
