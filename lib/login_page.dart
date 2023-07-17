import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/service/auth_service.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();
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
                            onPressed: () {},
                            child: const Text(
                              "Şifremi Unuttum",
                              style: TextStyle(color: Color.fromARGB(255, 111, 198, 114)),
                            ),
                          ),
                        ),
                        customSizedBox(),
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                try {
                                  final userResult = await firebaseAuth
                                      .signInWithEmailAndPassword(
                                          email: email, password: password);
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacementNamed(
                                      context, "/homePage");
                                  // ignore: avoid_print
                                  print(userResult.user!.email);
                                } catch (e) {
                                  // ignore: avoid_print
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Hata"),
                                        content: Text(e.toString()),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text("Geri Dön"))
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {}
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black),
                              child: const Center(
                                child: Text(
                                  "Giriş Yap",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 111, 198, 114),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //  void signIn() async{
                        //     if (formkey.currentState!.validate()) {
                        //     formkey.currentState!.save();
                        //     final result = await authService.signIn(email,password);
                        //     if (result == "success") {
                        //       Navigator.of(context).pushAndRemoveUntil(
                        //         MaterialPageRoute(builder: (context) => HomePage()),
                        //         (route) => false,);
                        //     } else {
                        //      showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //     return AlertDialog(
                        //     title: Text("Hata"),
                        //     content: Text(result!),
                        //     actions: [
                        //     TextButton(
                        //     onPressed: () => Navigator.pop(context),
                        //     child: Text("Geri Dön")
                        //      )
                        //     ],
                        //     );
                        //     },
                        //     );
                        //     }
                        //   }
                        // },

                        customSizedBox(),
                        Center(
                          child: TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/signUp"),
                            child: const Text(
                              "Hesap Oluştur",
                              style: TextStyle(color:Color.fromARGB(255, 111, 198, 114)),
                            ),
                          ),
                        ),
                        customSizedBox(),
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              // ignore: unused_local_variable
                              final result =
                                  await authService.signInAnonymous();
                              if (result != null) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacementNamed(
                                    context, "/homePage");
                              } else {
                                // ignore: avoid_print
                                print("Hata ile karşılaşıldı");
                              }
                            },
                            child: const Text(
                              "Misafir Girişi",
                              style: TextStyle(color: Color.fromARGB(255, 111, 198, 114)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        ));
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

