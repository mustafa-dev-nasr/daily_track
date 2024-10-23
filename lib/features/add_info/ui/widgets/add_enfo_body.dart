import 'package:daily_track/core/theming/app_colors.dart';
import 'package:daily_track/features/add_info/ui/widgets/center_add_enfo_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';

class AddContactBody extends StatelessWidget {
  const AddContactBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: purple4,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(16)),
                    ),
                    child: Text(
                      "ادخل صورتك",
                      style: AppTextStyles.font22WhiteMedium,
                    ))),
            Positioned(
                top: 330.h,
                left: 0,
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: purple4,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            3,
                          ),
                          bottomRight: Radius.circular(16)),
                    ),
                    child: Text(
                      "ادخل اسمك",
                      style: AppTextStyles.font22WhiteMedium,
                    ))),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CenterAddMemberBody(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
