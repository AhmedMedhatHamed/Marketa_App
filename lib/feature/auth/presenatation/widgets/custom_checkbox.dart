import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/feature/auth/presenatation/cubit/auth_cubit.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool? isActive = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topLeft,
      child: Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4.0,),),
        side: BorderSide(color: AppColor.greyColor,),
        activeColor: AppColor.primaryColor,
        value: isActive,
        onChanged: (value) {
          setState(() {
            isActive = value;
            BlocProvider.of<AuthCubit>(context).updateStateOfCheckBox(value);
          });
        },
      ),
    );
  }
}
