// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            title: Text("GlutenSiz"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Image.asset(
                    "assets/images/uygun.png",
                    height: 300,
                    width: 300,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "ÇÖLYAK BİR HASTALIK DEĞİL YAŞAM TARZIDIR",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        color: Color.fromARGB(255, 111, 198, 114),
                        fontWeight: FontWeight.bold,
                        shadows: const [
                          Shadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(2.0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
              // ignore: prefer_const_constructors
              child: Column(
            children: [
              DrawerHeader(
                child: Container(
                  color: Colors.yellow[200],
                ),
              ),
              myDrawerItem(
                  Icons.location_pin, "Glutensiz Mekanlar", "/mekanlar"),
              myDrawerItem(
                  Icons.barcode_reader, "Glutensiz Scanner", "/scanner"),
                                              
              myDrawerItem(
                  Icons.shopping_cart, "Glutensiz Ürünler", "/eticaret"),
              const Divider(
                color: Colors.grey,
              ),
              myDrawerItem(Icons.info, "Hakkımızda", "/hakkımızda"),
            ],
          ))),
    );
  }

  Widget myDrawerItem(IconData icon, String title, String routeName) =>
      ListTile(
        leading: Icon(
          icon,
          color: Colors.green[200],
        ),
        title: Text(title),
        onTap: () => Navigator.pushNamed(context, routeName),
      );
}
