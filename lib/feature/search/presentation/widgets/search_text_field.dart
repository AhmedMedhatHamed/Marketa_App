import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/feature/auth/presenatation/widgets/custom_text_field.dart';

class SearchTextField extends StatelessWidget {
   SearchTextField({super.key});

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomTextFormField(
        labelText: 'Search',
        controller: searchController,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        prefixIcon: Icon(IconlyLight.search),
        suffixIcon: IconButton(
          onPressed: () {
            searchController.clear();
            FocusScope.of(context).unfocus();
          },
          icon: Icon(Icons.clear, color: AppColor.errorMsgColor),
        ),
        onChanged: (value) {
          searchController.text = value;
        },
      ),
    );
  }
}