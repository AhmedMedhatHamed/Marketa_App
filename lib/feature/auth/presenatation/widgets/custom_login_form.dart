import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/core/widgets/custom_button.dart';
import 'package:marketa/feature/auth/presenatation/cubit/auth_cubit.dart';
import 'package:marketa/feature/auth/presenatation/widgets/custom_text_field.dart';

class CustomLoginWidget extends StatelessWidget {
  const CustomLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: authCubit.signInFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  onChanged: (value){
                    authCubit.emailAddress = value;
                  },
                  prefixIcon: Icon(Icons.email_outlined),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  labelText: 'Email Address',
                ),
                SizedBox(height: 20.0),
                CustomTextFormField(
                  onChanged: (value){
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
                SizedBox(height: 14.0),
                GestureDetector(
                  onTap: () {
                    context.go('/forgetPassword');
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      AppStrings.forgotPassword,
                      style: CustomTextStyles.poppins300styles16.copyWith(
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.16),
                CustomButton(
                    onPressed: () {
                      if(authCubit.signInFormKey.currentState!.validate()){}
                    },
                    text: AppStrings.login,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
