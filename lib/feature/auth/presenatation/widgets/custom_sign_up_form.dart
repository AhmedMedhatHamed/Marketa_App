import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/widgets/custom_button.dart';
import 'package:marketa/core/widgets/custom_snackbar.dart';
import 'package:marketa/feature/auth/presenatation/cubit/auth_cubit.dart';
import 'package:marketa/feature/auth/presenatation/widgets/custom_text_field.dart';
import 'package:marketa/feature/auth/presenatation/widgets/terms_and_condition.dart';
import 'custom_checkbox.dart';
import 'custom_toast.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          customShowSnackBar(context, state);
        } else if (state is AuthSuccessState) {
          customToast('Please Verify Your Account');
          context.go('/loginView');
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: authCubit.signupFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  onChanged: (value) {
                    authCubit.firstName = value;
                  },
                  prefixIcon: Icon(Icons.person),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  labelText: 'First Name',
                ),
                SizedBox(height: 20.0),

                CustomTextFormField(
                  onChanged: (value) {
                    authCubit.lastName = value;
                  },
                  prefixIcon: Icon(Icons.person),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  labelText: 'Last Name',
                ),
                SizedBox(height: 20.0),

                CustomTextFormField(
                  onChanged: (value) {
                    authCubit.emailAddress = value;
                  },
                  prefixIcon: Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  labelText: 'Email Address',
                ),
                SizedBox(height: 20.0),
                CustomTextFormField(
                  onChanged: (value) {
                    authCubit.password = value;
                  },
                  prefixIcon: Icon(Icons.lock),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.go,
                  obscureText: authCubit.isObscure,
                  suffixIcon: IconButton(
                    icon: Icon(
                      authCubit.isObscure!
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash_fill,
                    ),
                    onPressed: () {
                      authCubit.togglePasswordVisibility();
                    },
                  ),
                  labelText: 'Password',
                ),
                Row(
                  children: const
                  [
                    CustomCheckbox(),
                    TermsAndConditions(),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                state is AuthLoadingState?
                Align(
                  alignment: Alignment.topCenter,
                  child: CupertinoActivityIndicator(
                    color: AppColor.primaryColor,
                  ),
                ):
                CustomButton(
                  color: authCubit.isCheckBoxActive == false
                      ? Colors.grey
                      : AppColor.primaryColor,
                  onPressed: () {
                    if (authCubit.isCheckBoxActive == true) {
                      if (authCubit.signupFormKey.currentState!
                          .validate()) {
                        authCubit.signUpWithEmailAndPassword();
                      }
                    }
                  },
                  text: AppStrings.signUp,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
