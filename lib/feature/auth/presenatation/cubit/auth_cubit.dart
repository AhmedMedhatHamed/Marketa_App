import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  //XFile? pickedImage;
  String? emailAddress;
  String? password;
  String? firstName;
  String? lastName;
  GlobalKey<FormState> signupFormKey = GlobalKey();
  bool? isCheckBoxActive = false;
  bool? isObscure = true;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();

  void updateStateOfCheckBox(dynamic newValue) {
    isCheckBoxActive = newValue;
    emit(CheckBoxState());
  }

  void togglePasswordVisibility() {
    isObscure = !isObscure!;
    emit(PasswordVisibilityState());
  }

  Future<void> signUpWithEmailAndPassword() async {
    emit(AuthLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      await addUserProfile();
      await verifiedEmail();

      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState('The password is too weak!'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState('The account already exists for that email!'));
      } else if (e.code == 'invalid-email') {
        emit(AuthErrorState('Invalid Email!'));
      }
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    emit(SignInLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInErrorState('User not found'));
      } else if (e.code == 'wrong-password') {
        emit(SignInErrorState('Wrong password provided for that user.'));
      } else {
        emit(SignInErrorState('Check your email and password!'));
      }
    } catch (e) {
      emit(SignInErrorState(e.toString()));
    }
  }

  Future<void> verifiedEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> sendPasswordResetEmail() async {
    emit(ForgetPasswordLoadingState());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ForgetPasswordSuccessState());
    } on Exception catch (e) {
      emit(ForgetPasswordErrorState(e.toString()));
    }
  }

  Future<void> addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "email": emailAddress,
      "first_name": firstName,
      "last_name": lastName,
    });
  }
}
