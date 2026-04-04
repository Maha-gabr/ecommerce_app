import 'package:ecommerce_app/core/cashe/shared_prefs_utiles.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  bool isFullNameReadOnly = true;
  bool isEmailReadOnly = true;
  bool isPasswordReadOnly = true;
  bool isMobileNumberReadOnly = true;
  bool isAddressReadOnly = true;
  var name = SharedPrefsUtils.getData(key: 'name');
  var email=SharedPrefsUtils.getData(key: 'email');
  var phone =SharedPrefsUtils.getData(key: 'phone');
  var pass =SharedPrefsUtils.getData(key: 'pass');

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: name.toString());
    emailController = TextEditingController(text: email.toString());
    passwordController = TextEditingController(text: pass.toString());
    phoneController = TextEditingController(text:phone.toString());
    addressController = TextEditingController(text: '6th October, street 11.....');
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Welcome, $name',
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                  ),
                  IconButton(onPressed: (){
                    SharedPrefsUtils.removeData(key: 'token');
                    Navigator.pushNamedAndRemoveUntil(context, Routes.signInRoute, (route)=>false);
                  }, icon: Icon(Icons.logout,color: ColorManager.primary,))
                ],
              ),
              Text(
                email.toString(),
                style: getRegularStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s14),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                borderBackgroundColor: ColorManager.primary,
                readOnly: isFullNameReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your full name',
                label: 'Full Name',
                controller:
                    nameController,
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isFullNameReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.text,
                validation: AppValidators.validateFullName,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                borderBackgroundColor: ColorManager.primary,
                readOnly: isEmailReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your email address',
                label: 'E-mail address',
                controller: emailController,
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isEmailReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.emailAddress,
                validation: AppValidators.validateEmail,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                onTap: () {
                  setState(() {
                    isPasswordReadOnly = false;
                  });
                },
                controller: TextEditingController(text: '123456789123456'),
                borderBackgroundColor: ColorManager.primary,
                readOnly: isPasswordReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your password',
                label: 'Password',
                isObscured: true,
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: SvgPicture.asset(SvgAssets.edit),
                textInputType: TextInputType.text,
                validation: AppValidators.validatePassword,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              BuildTextField(
                controller:phoneController,
                borderBackgroundColor: ColorManager.primary,
                readOnly: isMobileNumberReadOnly,
                backgroundColor: ColorManager.white,
                hint: 'Enter your mobile no.',
                label: 'Your mobile number',
                labelTextStyle: getMediumStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
                suffixIcon: IconButton(
                  icon: SvgPicture.asset(SvgAssets.edit),
                  onPressed: () {
                    setState(() {
                      isMobileNumberReadOnly = false;
                    });
                  },
                ),
                textInputType: TextInputType.phone,
                validation: AppValidators.validatePhoneNumber,
                hintTextStyle: getRegularStyle(color: ColorManager.primary)
                    .copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: AppSize.s18.h),
              // BuildTextField(
              //   controller:
              //       TextEditingController(text: '6th October, street 11.....'),
              //   borderBackgroundColor: ColorManager.primary.withOpacity(.5),
              //   readOnly: isAddressReadOnly,
              //   backgroundColor: ColorManager.white,
              //   hint: '6th October, street 11.....',
              //   label: 'Your Address',
              //   labelTextStyle: getMediumStyle(
              //       color: ColorManager.primary, fontSize: FontSize.s18),
              //   suffixIcon: IconButton(
              //     icon: SvgPicture.asset(SvgAssets.edit),
              //     onPressed: () {
              //       setState(() {
              //         isAddressReadOnly = false;
              //       });
              //     },
              //   ),
              //   textInputType: TextInputType.streetAddress,
              //   validation: AppValidators.validateFullName,
              //   hintTextStyle: getRegularStyle(color: ColorManager.primary)
              //       .copyWith(fontSize: 18.sp),
              // ),
              // SizedBox(height: AppSize.s50.h),
            ],
          ),
        ),
      ),
    );
  }
}
