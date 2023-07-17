import 'package:flutter/material.dart';
import 'package:flutter_application_1/e_ticaret/pages/CartPage.dart';

class Product {
  final String title;
  final String description;
  final double price;
  final String imagePath;

  Product({
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

class ItemsWidget extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: 'Glutensiz Kurabiye',
      description: '',
      price: 55,
      imagePath: 'assets/images/1.png',
    ),
    Product(
      title: 'Glutensiz Ekmek',
      description: '',
      price: 60,
      imagePath: 'assets/images/2.png',
    ),
    Product(
      title: 'Glutensiz Kek Karışımı',
      description: '',
      price: 70,
      imagePath: 'assets/images/3.png',
    ),
    // Diğer ürünler
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (var product in products)
          Container(
            padding: EdgeInsets.only(left: 5, right: 5, top: 5),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFF80C783),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "-50%",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "ItemPage");
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      product.imagePath,
                      height: 90,
                      width: 90,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF80C783),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF80C783),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.price}₺',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF80C783),
                        ),
                      ),
                      Spacer(),
                      Badge(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "CartPage");
                          },
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Color(0xFF80C783),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
