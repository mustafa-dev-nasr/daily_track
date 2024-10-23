import 'package:daily_track/core/helpers/extensions/app_navigotion.dart';
import 'package:daily_track/core/theming/app_text_styles.dart';
import 'package:daily_track/core/widgets/add_text_form_field.dart';
import 'package:daily_track/features/add_info/ui/widgets/add_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/route.dart';
import 'end_add_info.dart';

class CenterAddMemberBody extends StatefulWidget {
  const CenterAddMemberBody({
    super.key,
  });

  @override
  State<CenterAddMemberBody> createState() => _CenterAddMemberBodyState();
}

class _CenterAddMemberBodyState extends State<CenterAddMemberBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, email, fanction, phone, _imagePath;

  void onImageSelected(String imagePath) {
    setState(() {
      _imagePath = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AddImage(
              onImageSelected: (String imagePath) {
                setState(() {
                  _imagePath = imagePath;
                });
              },
            ),

            120.verticalSpace,
            AppTextFormField(
                hintText: "الاسم",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "لا يمكن أن يكون فارغا";
                  }
                  return null;
                }),

            // AddImage(onImageSelected: onImageSelected), // إضافة AddImage هنا
            50.verticalSpace,
            Align(
              child: EndAddMember(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.pushReplacementNamed(Routes.homeScreen);
                    // formKey.currentState!.save();
                    // var contactModel = ContactModel(
                    //   name: name!,
                    // );

                    // BlocProvider.of<AddMemberCubit>(context).addMember(
                    //   member: contactModel, // تمرير الشخص الجديد كمعامل 'member'
                    //   imagePath: _imagePath, // تمرير مسار الصورة
                    // );
                    // BlocProvider.of<MemberCubit>(context).fetchAllMember();
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactModel {
  String name;

  ContactModel({
    required this.name,
  });
}
