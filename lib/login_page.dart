import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  final void Function() fun2;
  const LoginPage({required this.fun2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "StudyGPT",
              style: TextStyle(fontSize: 39, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 25),
            const Text(
              'Your doorway to success',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),

            const SizedBox(height: 25),

            Image.asset('assets/mainimage.webp'),

            const SizedBox(height: 40.0),

            //<-------     Google signin button    ------->
            ElevatedButton.icon(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  const Size(340.0, 60.0),
                ),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 255, 255, 255)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                ),
                elevation: MaterialStateProperty.all<double>(1.0),
                side: MaterialStateProperty.all<BorderSide?>(const BorderSide(
                    color: Color.fromARGB(254, 108, 100, 254), width: 3.5)),
              ),
              onPressed: () {
                AuthMethods(fun2: fun2).signInWithGoogle(context);
              },
              icon: Image.asset(
                'assets/google_icon.png',
                scale: 14,
              ),
              label: const Text(
                " Continue with Google  ",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22.0,
                ),
              ),
            ),

            const SizedBox(height: 4.0),

            const SizedBox(height: 8.0),

            //<-------     Apple signin button    ------->

            ElevatedButton.icon(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  const Size(340.0, 60.0),
                ),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 255, 255, 255)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.fromLTRB(20, 15, 20, 15),
                ),
                elevation: MaterialStateProperty.all<double>(1.0),
                side: MaterialStateProperty.all<BorderSide?>(const BorderSide(
                    color: Color.fromARGB(254, 108, 100, 254), width: 3.5)),
              ),
              onPressed: () {},
              icon: Image.asset(
                'assets/apple-icon.png',
                scale: 13,
              ),
              label: const Text(
                " Continue with Apple  ",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
