import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/core/utills/app_color.dart';
import 'package:marketa/core/utills/app_images.dart';
import 'package:marketa/core/utills/text_styles.dart';
import 'package:marketa/feature/profile/presentation/cubit/user_cubit/user_cubit.dart';

class AccountDetailsRow extends StatelessWidget {
  const AccountDetailsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          final user = state.userModel;
          return _buildRow(
            imageUrl: user.pickedImage,
            name: '${user.firstName}${user.lastName}',
            email: user.emailAddress,
          );
        }
        return _buildRow();
      },
    );
  }

  Widget _buildRow({String? imageUrl, String? name, String? email}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.secondColor, width: 2),
              image: DecorationImage(
                image: (imageUrl != null && imageUrl.isNotEmpty)
                    ? NetworkImage(imageUrl)
                    : const AssetImage(AppAssets.person) as ImageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (name != null && name.trim().isNotEmpty)
                    ? name
                    : 'Welcome, Guest!',
                style: CustomTextStyles.poppinsBoldStyles18Black,
              ),
              Text(
                (email != null && email.trim().isNotEmpty)
                    ? email
                    : 'Login to access your account',
                style: CustomTextStyles.poppins300styles16,
              ),
            ],
          ),
        ],
      ),
    );
  }}