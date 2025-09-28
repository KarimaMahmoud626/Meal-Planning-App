import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.categoryName,
    required this.image,
    required this.isPicked,
  });

  final String categoryName;
  final String image;
  final bool isPicked;

  @override
  Widget build(BuildContext context) {
    return isPicked
        ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(200, 78, 174, 137),
                radius: 37.5,
                child: CircleAvatar(
                  radius: 34.5,
                  child: ClipOval(
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: 75,
                      height: 75,
                    ),
                  ),
                ),
              ),
              Text(
                categoryName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
        : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 37.5,
                child: ClipOval(
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 75,
                    height: 75,
                  ),
                ),
              ),
              Text(
                categoryName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
  }
}
