import 'package:flutter/material.dart';
import 'package:flutter_application_1/e_ticaret/models/product.dart';
class ProductProvider with ChangeNotifier {
  List<Product> products = [
    Product(name: "pronot", price: 55.0, imagePath: 'images/1.png'),
    Product(name: "ekmek", price: 65.0, imagePath: 'images/.png'),
    // Diğer ürünler
  ];

  // Diğer fonksiyonlar ve işlemler

  // ...
}
