// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/auth_service.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  final emailTextFiled = TextEditingController();
  final nameTextFiled = TextEditingController();
  final passwordTextFiled = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * .25,
                  decoration: const BoxDecoration(),
                ),
                Padding(
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Merhaba, Hoş geldin",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 111, 198, 114),
                              fontWeight: FontWeight.bold),
                        ),
                        customSizedBox(),
                        TextFormField(
                          controller: emailTextFiled,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Bilgileri Eksiksiz Doldurunuz";
                            } else {}
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: customInputDecoration("E-mail"),
                        ),
                        customSizedBox(),
                        TextFormField(
                          controller: nameTextFiled,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Bilgileri Eksiksiz Doldurunuz";
                            } else {}
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: customInputDecoration("Ad Soyad"),
                        ),
                        customSizedBox(),
                        TextFormField(
                          controller: passwordTextFiled,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Bilgileri Eksiksiz Doldurunuz";
                            } else {}
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          decoration: customInputDecoration("Şifre"),
                        ),
                        customSizedBox(),
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              final authService = AuthService();

                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();

                                final bool user = await authService
                                    .createUserWithEmailAndPassword(
                                        emailTextFiled.text,
                                        passwordTextFiled.text);
                                // ignore: avoid_print
                                print(user);
                                // ignore: unnecessary_null_comparison
                                if (user != null) {
                                  formkey.currentState!.reset();
                                  Navigator.pushReplacementNamed(
                                      context, '/loginPage');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Kullanıcı başarıyla kaydedildi, giriş sayfasına yönlendiriliyorsunuz"),
                                    ),
                                  );
                                } else {}
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Data bos"),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              "Hesap Oluştur",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 111, 198, 114)),
                            ),
                          ),
                        ),
                        customSizedBox(),
                        Center(
                          child: TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/loginPage"),
                            child: const Text(
                              "Giriş Sayfasına Geri Dön",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 111, 198, 114)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customSizedBox() => const SizedBox(
        height: 20,
      );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )));
  }
}
