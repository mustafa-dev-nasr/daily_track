import 'package:daily_track/core/helpers/extensions/app_navigotion.dart';
import 'package:daily_track/core/theming/app_text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/route.dart';
import '../../../../core/widgets/app_text_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Column(
          children: [
            Image.asset("assets/images/Image (1).png"),
            80.verticalSpace,
            Text(
              "Daily Track",
              style: AppTextStyles.font36BlackRegular,
            ),
            20.verticalSpace,
            Text(
              "Effortlessly organize your tasks",
              style: AppTextStyles.font20BlackMedium,
            ),
            40.verticalSpace,
            AppTextButton(
              onPressed: () {
                context.pushNamed(Routes.homeScreen);
              },
              buttonText: 'Get Started',
              textStyle: AppTextStyles.font16WhiteBold,
            )
          ],
        ),
      )),
    );
  }
}
