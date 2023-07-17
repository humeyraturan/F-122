import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),
          Text(
            "Sepetim",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF80C783),
            ),
          ),
          Spacer(),
          Icon(
            Icons.more_vert,
            size: 30,
            color: Color(0xFF80C783),
          ),
        ],
      ),
    );
  }
}
