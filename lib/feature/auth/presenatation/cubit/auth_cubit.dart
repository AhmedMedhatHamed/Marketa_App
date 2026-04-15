import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketa/core/app_function/app_methods.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  XFile? pickedImage;
  String? emailAddress;
  String? password;
  String? firstName;
  String? lastName;
  List? userWish;
  List? userCart;
  Timestamp? createdAt;
  ////////////////////
  GlobalKey<FormState> signupFormKey = GlobalKey();
  bool? isCheckBoxActive = false;
  bool? isObscure = true;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();
//////////////////////////////////////////////////////////////

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

      await FirebaseAuth.instance.currentUser!.updateDisplayName(
        '$firstName $lastName',
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
    final user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .set({
      "userId": user.uid,
      "email": emailAddress ?? '',
      "first_name": firstName ?? '',
      "last_name": lastName ?? '',
      "createdAt": Timestamp.now(),
      "userCart": [],
      "userWish": [],
      "userImage": pickedImage,
    });
  }


  Future<String> uploadUserImage() async {
    if (pickedImage == null) return '';

    final ref = FirebaseStorage.instance
        .ref()
        .child('userImages')
        .child('${FirebaseAuth.instance.currentUser!.uid}.jpg');

    await ref.putFile(File(pickedImage!.path));

    final imageUrl = await ref.getDownloadURL();

    return imageUrl;
  }


  Future<void> localPickImage(BuildContext context) async {
    ImagePicker imagePicker = ImagePicker();

    AppMethods.pickImageDialog(
      context: context,
      cameraFct: () async {
        final image = await imagePicker.pickImage(source: ImageSource.camera);
        if (image != null) {
          pickedImage = image;
          emit(CameraPicker());
        }
      },
      galleryFct: () async {
        final image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          pickedImage = image;
          emit(GalleryPicker());
        }
      },
      remove: () {
        pickedImage = null;
        emit(RemovePicker());
      },
    );
  }

  // Future<void> signInWithGoogle() async {
  //   emit(SignInLoadingState());
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) {
  //       emit(SignInErrorState('Cancelled'));
  //       return;
  //     }
  //
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     await addUserProfile();
  //     await verifiedEmail();
  //
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     emit(SignInSuccessState());
  //   } catch (e) {
  //     emit(SignInErrorState(e.toString()));
  //   }
  // }


}
