import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String emailAddress, firstName, lastName, userId;
  final String? pickedImage;
  final List userWish, userCart;
  final Timestamp createdAt;

  UserModel({
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.pickedImage,
    required this.userWish,
    required this.userCart,
    required this.createdAt,
  });
}
