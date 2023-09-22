import 'dart:async';

import 'package:classico/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage(title:"Cred_app"),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Center(
          child: RichText(
            text: const TextSpan(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'CRED ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'mint',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ]),
          ),
        ),
      ),
    );
  }
}
