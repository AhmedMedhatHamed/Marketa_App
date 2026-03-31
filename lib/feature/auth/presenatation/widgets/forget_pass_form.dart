import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/app_function/custom_navigate.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/widgets/custom_button.dart';
import 'package:marketa/feature/auth/presenatation/cubit/auth_cubit.dart';
import 'custom_text_field.dart';
import 'custom_toast.dart';

class CustomForgetPasswordForm extends StatelessWidget {
  const CustomForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccessState) {
          customToast('Check Your Email Messages!');
          customReplacementNavigate(context, '/loginView');
        } else if (state is ForgetPasswordErrorState) {
          customToast('Please try again later!');
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.forgetPasswordFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 30.0),
                CustomTextFormField(
                  onChanged: (value) {
                    authCubit.emailAddress = value;
                  },
                  labelText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.send,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                state is ForgetPasswordLoadingState
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: CupertinoActivityIndicator(
                          color: AppColor.primaryColor,
                        ),
                      )
                    : CustomButtonWithIcon(
                        color: AppColor.primaryColor,
                        text: 'Reset password',
                        icon: Icon(
                          IconlyBold.send,
                          size: 24.0,
                          color: AppColor.offWhite,
                        ),
                        onPressed: () async {
                          if (authCubit.forgetPasswordFormKey.currentState!
                              .validate()) {
                            await authCubit.sendPasswordResetEmail();
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
