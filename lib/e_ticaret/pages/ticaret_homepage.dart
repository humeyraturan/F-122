import 'package:flutter/material.dart';
import 'package:flutter_application_1/e_ticaret/widgets/HomeAppBar.dart';
import '../widgets/ItemsWidget.dart';
import '../widgets/KategoriWidget.dart';


class ticaret_homepage extends StatelessWidget {
  const ticaret_homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            //height: 500,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 2),
                        height: 50,
                        width: 200,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "ara...",
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.camera_alt,
                        color: Color(0xFF4C53A5),
                        size: 27,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Kategori",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFF59C)),
                  ),
                ),
                //kategori
                KategoriWidget(),

                //ıtems
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Text(
                    "En İyiler",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFF59C),
                    ),
                  ),
                ),

                ItemsWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}