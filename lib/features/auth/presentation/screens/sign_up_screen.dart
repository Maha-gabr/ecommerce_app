import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/di.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/app_dialog.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';
import '../../cubit/auth/auth_states.dart';
import '../../cubit/auth/register/register_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  RegisterViewModel registerViewModel = getIt<RegisterViewModel>();
  var formKey = GlobalKey<FormState>();
  Future<void> register () async {
    if(formKey.currentState!.validate()){
    await  registerViewModel.register(
        passController.text,
        emailController.text,
        nameController.text,
        phoneController.text.trim(),
        repassController.text);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, AuthStates>(
      bloc: registerViewModel,
      listener: (context, state) {
        if(state is AuthLoadingStates){
          AppDialog.showLoading(context: context);
        }
        if(state is AuthErrorState){
          AppDialog.hideLoading(context: context);
          AppDialog.showMessage(
              context: context,
              message: state.appExceptions.message,
              title: 'Error' ,
              posActionName: 'Ok',
              positiveAction: () {
                Navigator.pop(context);
              }
          );
        }
        if(state is AuthSuccessStates){
          AppDialog.hideLoading(context: context);
          AppDialog.showMessage(
              context: context,
              message: 'Login Successfully',
              title: 'Success',
              posActionName: 'Ok',
              positiveAction: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.mainRoute, (route) => false);
              }
          );
        }
      },
  child: Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      BuildTextField(
                        controller: nameController,
                        backgroundColor: ColorManager.white,
                        hint: 'enter your full name',
                        label: 'Full Name',
                        textInputType: TextInputType.name,
                        validation: AppValidators.validateFullName,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      BuildTextField(
                        controller: phoneController,
                        hint: 'enter your mobile no.',
                        backgroundColor: ColorManager.white,
                        label: 'Mobile Number',
                        validation: AppValidators.validatePhoneNumber,
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      BuildTextField(
                        controller: emailController,
                        hint: 'enter your email address',
                        backgroundColor: ColorManager.white,
                        label: 'E-mail address',
                        validation: AppValidators.validateEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      BuildTextField(
                        controller: passController,
                        hint: 'enter your password',
                        backgroundColor: ColorManager.white,
                        label: 'password',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: AppSize.s18.h,
                      ),
                      BuildTextField(
                        controller: repassController,
                        hint: 'confirm your password',
                        backgroundColor: ColorManager.white,
                        label: 'confirm your password',
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: AppSize.s50.h,
                      ),
                      Center(
                        child: SizedBox(
                          height: AppSize.s60.h,
                          width: MediaQuery.of(context).size.width * .9,
                          child: CustomElevatedButton(
                            // borderRadius: AppSize.s8,
                            label: 'Sign Up',
                            backgroundColor: ColorManager.white,
                            textStyle: getBoldStyle(
                                color: ColorManager.primary, fontSize: AppSize.s20),
                            onTap: () async {
                             await register();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
);
  }
}
