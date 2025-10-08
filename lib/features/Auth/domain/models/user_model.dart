import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';

class UserModel extends Equatable {
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
      kName: name,
      kAddress: address,
      kEmail: email,
      kPhoneNumber: phoneNumber,
    };
  }

  @override
  List<Object?> get props => [name, address, email, phoneNumber];
}
