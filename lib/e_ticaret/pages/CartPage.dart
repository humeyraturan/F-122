import 'package:flutter/material.dart';
import 'package:flutter_application_1/e_ticaret/widgets/CartBottomNavBar.dart';
import 'package:flutter_application_1/e_ticaret/widgets/CartItemSamples.dart';

import '../widgets/CartAppBar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            ),
            child: Column(
              children: [
                CartItemSamples(),
                CartAppBar(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFE9B66D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "kupon ekle",
                          style: TextStyle(
                            color: Color(0XFFE9B66D),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
