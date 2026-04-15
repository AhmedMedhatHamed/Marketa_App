import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa/feature/profile/data/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  UserModel? userModel;

  UserModel? get getUserModel => userModel;

  Future<void> displayUserInfo() async {
    if (userModel != null) return;

    emit(UserLoading());

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      emit(UserError("User not logged in"));
      return;
    }

    try {
      final userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        emit(UserError("User data not found"));
        return;
      }

      final data = userDoc.data()!;

      userModel = UserModel(
        userId: data['userId'] ?? '',
        userCart: data['userCart'] ?? [],
        userWish: data['userWish'] ?? [],
        createdAt: data['createdAt'],
        emailAddress: data['email'] ?? '',
        firstName: data['first_name'] ?? '',
        lastName: data['last_name'] ?? '',
        pickedImage: data['userImage'] ?? '',
      );

      emit(UserLoaded(userModel!));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}