import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/feature/auth/presenatation/widgets/custom_text_field.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomTextFormField(
        labelText: 'Search',
        controller: searchController,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
        prefixIcon: const Icon(IconlyLight.search),
        suffixIcon: IconButton(
          onPressed: () {
            searchController.clear();
            FocusScope.of(context).unfocus();
          },
          icon: Icon(Icons.clear, color: AppColor.errorMsgColor),
        ),
      ),
    );
  }
}