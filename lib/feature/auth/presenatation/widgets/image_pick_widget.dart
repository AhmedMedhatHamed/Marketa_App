import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketa/core/utills/app_color.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key, this.pickedImage, this.onTap});

  final XFile? pickedImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: pickedImage == null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: BoxBorder.all(),
                      ),
                    ),
                  )
                : Image.file(File(pickedImage!.path), fit: BoxFit.fill),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Material(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColor.primaryColor,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(8.0),
                splashColor: AppColor.secondColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: AppColor.offWhite,
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
