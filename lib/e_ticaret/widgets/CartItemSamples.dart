import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final String title;
  final String imagePath;
  final double price;

  Product({
    required this.title,
    required this.imagePath,
    required this.price, required String name,
  });
}

class CartItemSamples extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: "Glutensiz Kurabiye",
      imagePath: "assets/images/1.png",
      price: 55.0, name: '',
    ),
    Product(
      title: "Glutensiz Ekmek",
      imagePath: "assets/images/2.png",
      price: 65.0, name: '',
    ),
    Product(
      title: "Glutensiz Kek Karışımı",
      imagePath: "assets/images/3.png",
      price: 75.0, name: '',
    ),
    // Diğer ürünler
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < products.length; i++)
          Container(
            height: 120,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Radio(
                  value: "",
                  groupValue: "",
                  onChanged: (index) {},
                ),
                Container(
                  height: 60,
                  width: 40,
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset(products[i].imagePath),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        products[i].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF80C783),
                        ),
                      ),
                      Text(
                        "\$${products[i].price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF80C783),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Icon(
                              CupertinoIcons.plus,
                              size: 18,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "01",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF80C783),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Icon(
                              CupertinoIcons.minus,
                              size: 18,
                            ),
                          ),
                        ],
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
