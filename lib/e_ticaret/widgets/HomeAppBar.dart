//import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            size: 20,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "GlutenSiz Shop",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF80C783),
              ),
            ),
          ),
          Spacer(),
          Badge(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "cartPage");
              },
              child: Icon(
                CupertinoIcons.cart_fill,
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
