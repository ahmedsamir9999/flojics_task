import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../movies/presentation/screens/home_screen.dart';

class Services {
  final auth = FirebaseAuth.instance;

  signIn(
      {required String emailSignIn,
      required String passwordSignIn,
      required context}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: emailSignIn, password: passwordSignIn);

      Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(

            title: const Center(child: Text('failed')),
            content: Text(e.code,
              textAlign: TextAlign.center,
            ),
          ));
    }
  }

  register(
      {required String emailSignUp,
      required String passwordSignUp,
      required context}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailSignUp, password: passwordSignUp);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(

                title: const Center(child: Text('failed')),
                content: Text(e.code,
                  textAlign: TextAlign.center,
                ),
              ));

    }
  }
}
