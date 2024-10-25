import 'package:daily_track/core/helpers/extensions/app_navigotion.dart';
import 'package:daily_track/core/widgets/add_text_form_field.dart';
import 'package:daily_track/features/onboarding/ui/widgets/add_image.dart';
import 'package:flutter/material.dart';
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
            const Text(
              "Daily Track",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
                height: 1.2,
              ),
            ),
            AddImage(
              onImageSelected: (String imagePath) {
                setState(() {
                  _imagePath = imagePath;
                });
              },
            ),
            50.verticalSpace,
            AppTextFormField(
                hintText: "Name",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Can't be empty";
                  }
                  return null;
                }),
            50.verticalSpace,
            EndAddMember(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.pushNamedAndRemoveUntil(
                    Routes.homeScreen,
                    (Route<dynamic> route) => false,
                  ); // formKey.currentState!.save();
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
