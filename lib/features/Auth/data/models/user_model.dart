import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';

class UserModel extends Equatable {
  final String? name;
  final String? gender;
  final String? email;
  final num? height;
  final num? weight;
  final num? age;
  final num? neededCalories;

  const UserModel({
    this.neededCalories,
    this.height,
    this.weight,
    this.age,
    this.name,
    this.gender,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      email: data[kEmail] ?? '',
      name: data[kName] ?? '',
      gender: data[kGender] ?? '',
      height: data[kHeight] ?? 0,
      weight: data[kWeight] ?? 0,
      age: data[kAge] ?? 0,
      neededCalories: data[kNeededCalories] ?? 0,
    );
  }

  toJson() {
    return {
      kName: name,
      kEmail: email,
      kGender: gender,
      kHeight: height,
      kWeight: weight,
      kAge: age,
      kNeededCalories: neededCalories,
    };
  }

  @override
  List<Object?> get props => [
    name,
    email,
    gender,
    age,
    height,
    weight,
    neededCalories,
  ];
}
