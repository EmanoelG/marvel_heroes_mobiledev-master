import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_heroes_yt/utils/nav.dart';

import '../Home/HomePage.dart';
import '../Page/login_page.dart';
import '../firebase_options.dart';
import '../main.dart';

class SplashPage extends StatefulWidget {
  SplashPage() : super();

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    Future firebaseLogin = Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Future futureB = Future.delayed(const Duration(seconds: 10));

    Future.wait([firebaseLogin, futureB]).then(
      (List values) {
        print(values);
        push(context, HomePage(), replace: false); //LoginPage
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
          child: CircularProgressIndicator(
        color: Colors.black,
      )),
    );
  }
}
