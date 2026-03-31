import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketa/core/app_function/app_methods.dart';
import 'package:marketa/core/utills/app_strings.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/feature/auth/presenatation/widgets/custom_sign_up_form.dart';
import 'package:marketa/feature/auth/presenatation/widgets/have_account_widget.dart';
import 'package:marketa/feature/auth/presenatation/widgets/image_pick_widget.dart';
import 'package:marketa/feature/auth/presenatation/widgets/welcome_text.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    XFile? pickedImage;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              centerTitle: true,
              title: Text(
                AppStrings.createAccount,
                style: CustomTextStyles.poppins500styles24Black.copyWith(
                  fontSize: 18.0,
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            SliverToBoxAdapter(
              child: WelcomeText(
                text1: AppStrings.appName,
                text2: AppStrings.signUpDesc,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20.0)),
            SliverToBoxAdapter(
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ImagePickerWidget(
                    onTap: () {
                      AppMethods.pickImageDialog(
                        context: context,
                        cameraFct: () {},
                        galleryFct: () {},
                        remove: () {},
                      );
                    },
                    pickedImage: pickedImage,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            SliverToBoxAdapter(child: CustomSignUpForm()),
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            SliverToBoxAdapter(
              child: HaveAccountWidget(
                text1: AppStrings.alreadyHaveAccount,
                text2: AppStrings.login,
                onTap: () {
                  context.go('/loginView');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
