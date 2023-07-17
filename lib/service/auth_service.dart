import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firebaseAuth = FirebaseAuth.instance;

  Future<bool> createUserWithEmailAndPassword(
      String email, String password) async {
    User? curentUser;
    try {
      curentUser = await firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
         
          .then((value) {
        if (value.user!.uid.isNotEmpty) {
          // Firestore'e kullanıcıyı kaydet
          userCollection.doc(value.user!.uid).set({
            'email': email,
            // Diğer kullanıcı bilgilerini buraya ekleyebilirsiniz
          });
         
          print(value.user!.email);
          curentUser = value.user;
        } else {
          
          print('error while adding user');
        }
      });
    } catch (e) {
      
      print("Create user error: $e");
      return false;
    }
    return curentUser != null ? true : false;
  }

  Future signInAnonymous() async {
    try {
      final result = await firebaseAuth.signInAnonymously();
     
      print(result.user!.uid);
      return result.user;
    } catch (e) {
      
      print("Anon error $e");
      return null;
    }
  }

  Future forgotPassword(String email) async {
    String? res;
    try {
      // ignore: unused_local_variable, prefer_typing_uninitialized_variables
      var password;
      // ignore: unused_local_variable
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        res = "Kullanıcı Bulunamadı";
      } else if (e.code == "wrong-password") {
        res == "Şifre Yanlış";
      } else if (e.code == "user-disabled") {
        res = "Kullanıcı Aktif Değil";
      }
    }
    return res;
  }

  signIn(String email, String password) {}
}
