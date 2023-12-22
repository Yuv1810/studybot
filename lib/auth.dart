import 'page1.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'database.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final void Function() fun2;
  AuthMethods({required this.fun2});

  final storage = new FlutterSecureStorage();

  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;

    if (result != null) {
      print(credential);

      Map<String, dynamic> userInfoMap = {
        "email": userDetails!.email,
        "name": userDetails.displayName,
        "imgUrl": userDetails.photoURL,
        "id": userDetails.uid,
      };

      await storage.write(key: "mail", value: userInfoMap["email"]);

      DatabaseMethods().addUser(userDetails.uid, userInfoMap).then((value) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Page1(fun2: fun2)));
      });
    }
  }
}
