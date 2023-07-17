import 'package:flutter/material.dart';

class Eticaret extends StatefulWidget {
  const Eticaret({super.key});

  @override
  State<Eticaret> createState() => _EticaretState();
}

class _EticaretState extends State<Eticaret> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: 
        Text("Pazar Yeri")),
    );
  }
}
