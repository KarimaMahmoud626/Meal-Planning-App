import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meal_planning_app/features/splash/presentation/splash_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // await seedItems();

  runApp(const MealPlanningApp());
}

Future<void> seedItems() async {
  final db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> items = [
    {
      'name': 'White Bread',
      'imageUrl': 'https://www.pinterest.com/pin/340866265568445743/',
      'price': 2,
      'category': 'bread',
      'liked': false,
      'description': '',
    },
    {
      'name': 'Baguette',
      'imageUrl': 'https://www.pinterest.com/pin/409264684907426335/',
      'price': 3,
      'category': 'bread',
      'liked': false,
      'description': '',
    },
    {
      'name': 'Brioche',
      'imageUrl': 'https://www.pinterest.com/pin/314900198967479154/',
      'price': 3,
      'category': 'bread',
      'liked': false,
      'description': '',
    },
    {
      'name': 'Whole Whaet Bread',
      'imageUrl': 'https://www.pinterest.com/pin/185773553374663811/',
      'price': 2,
      'category': 'bread',
      'liked': false,
      'description': '',
    },
    {
      'name': 'English Muffin',
      'imageUrl': 'https://www.pinterest.com/pin/4599864195002058240/',
      'price': 5,
      'category': 'bread',
      'liked': false,
      'description': '',
    },
    {
      'name': 'Beef',
      'imageUrl': 'https://www.pinterest.com/pin/529173024936499811/',
      'price': 5,
      'category': 'protein',
      'liked': false,
      'description': '',
    },
    {
      'name': 'Ribeye',
      'imageUrl': 'https://www.pinterest.com/pin/158259374397307255/',
      'price': 4,
      'category': 'protein',
      'liked': false,
      'description': '',
    },
    {
      'name': 'Smokin Turkey',
      'imageUrl': 'https://www.pinterest.com/pin/993043786586822746/',
      'price': 7,
      'category': 'protein',
      'liked': false,
      'description': '',
    },
    {
      'name': 'Srimp',
      'imageUrl': 'https://www.pinterest.com/pin/672091944382101911/',
      'price': 4,
      'category': 'protein',
      'liked': false,
      'description': '',
    },
    {
      'name': 'Salmon Steak',
      'imageUrl': 'https://www.pinterest.com/pin/1060949624710226728/',
      'price': 6,
      'category': 'protein',
      'liked': false,
      'description': '',
    },
  ];

  for (var item in items) {
    await db.collection('grocerry_items').add(item);
  }
}

class MealPlanningApp extends StatelessWidget {
  const MealPlanningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
