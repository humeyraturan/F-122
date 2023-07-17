import 'package:flutter/material.dart';

class Category {
  final String title;
  final String imagePath;

  Category({required this.title, required this.imagePath});
}

class KategoriWidget extends StatelessWidget {
  final List<Category> categories = [
    Category(title: 'ÇİKOLATA', imagePath: 'assets/images/1.png'),
    Category(title: 'EKMEK', imagePath: 'assets/images/2.png'),
    Category(title: 'UN', imagePath: 'assets/images/3.png'),
    // Diğer kategoriler
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  category.imagePath,
                  width: 30,
                  height: 30,
                ),
                SizedBox(width: 4),
                Text(
                  category.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF80C783),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
