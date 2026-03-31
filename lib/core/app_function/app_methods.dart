import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/text_styles.dart';

class AppMethods {
  static Future<void> errorAndWarningDialog({
    required BuildContext context,
    required String text,
    required void Function()? onPressed,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.warning, width: 60.0, height: 60.0),
              SizedBox(height: 15.0),
              Text(text, style: CustomTextStyles.poppins400styles18Black),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Visibility(
                      visible: !isError,
                      child: Text(
                        'Cancel',
                        style: CustomTextStyles.poppins400styles18Black
                            .copyWith(color: AppColor.secondColor),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onPressed,
                    child: Text(
                      'OK',
                      style: CustomTextStyles.poppins400styles18Black.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> pickImageDialog({
    required BuildContext context,
    required Function cameraFct,
    required Function galleryFct,
    required Function remove,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Center(child: Text('Choose option')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                onPressed: () {
                  cameraFct();
                  Navigator.pop(context);
                },
                label: Text(
                  'Camera',
                  style: CustomTextStyles.poppins400styles18Black,
                ),
                icon: Icon(
                  IconlyBold.camera,
                  color: AppColor.primaryColor,
                  size: 24.0,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  galleryFct();
                  Navigator.pop(context);
                },
                label: Text(
                  'Gallery',
                  style: CustomTextStyles.poppins400styles18Black,
                ),
                icon: Icon(
                  IconlyBold.image,
                  color: AppColor.primaryColor,
                  size: 24.0,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  remove();
                  Navigator.pop(context);
                },
                label: Text(
                  'Remove',
                  style: CustomTextStyles.poppins400styles18Black,
                ),
                icon: Icon(
                  Icons.remove,
                  color: AppColor.primaryColor,
                  size: 24.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
