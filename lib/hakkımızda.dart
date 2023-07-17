// ignore_for_file: file_names

import 'package:flutter/material.dart';


class Hakkimizda extends StatefulWidget {
  const Hakkimizda({super.key});

  @override
  State<Hakkimizda> createState() => _HakkimizdaState();
}

class _HakkimizdaState extends State<Hakkimizda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
        "Herkese merhaba, Biz de bir çölyaklı olarak yaşadığımız zorlukları nasıl daha aza indirgeyebiliriz diye düşündük ve glutensiz tüm mekanların tek bir haritada toplandığı, üzerinde glutensiz ibaresi olmayan ürünlerin içeriğini okumaya gerek kalmadan barkod okuyucuyla gluten olmadığını anında öğrenebildiğimiz ve glutensiz tüm ürünleri satın alabileceğimiz, hepsini tek bir yerde görebileceğimiz bir uygulama yapmaya karar verdik. Güvenle alışveriş yapabilirsiniz.",
        textAlign: TextAlign.center,
          style: TextStyle(                                                     
          fontSize: 20,    
          color: Colors.green,
          fontWeight: FontWeight.bold,
          
          shadows: [
            Shadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(2.0, 0),
            ),
          ],
        ), 
            ),
      ),
    );
  }
}