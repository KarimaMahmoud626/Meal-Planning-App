import 'package:meal_planning_app/core/constants.dart';

class UserModel {
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? email;

  UserModel({this.name, this.address, this.phoneNumber, required this.email});

  factory UserModel.fromJson(data) {
    return UserModel(
      email: data[kEmail],
      name: data[kName],
      phoneNumber: data[kPhoneNumber],
      address: data[kAddress],
    );
  }

  toJson() {
    return {
      kName: this.name,
      kAddress: this.address,
      kEmail: this.email,
      kPhoneNumber: this.phoneNumber,
    };
  }
}
