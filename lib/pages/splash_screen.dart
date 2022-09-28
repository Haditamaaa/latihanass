import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mabesal/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _isVisible = false;
  _SplashScreenState(){

    Timer(const Duration(milliseconds: 20000),() async {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
      });
    });

    Timer(
      const Duration(milliseconds: 10), () async {
        setState(() {
          _isVisible = true;
        });
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).primaryColor],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: const Duration(milliseconds: 1200),
        child: Center(
          child: SizedBox(
            height: 380,
            width: 402,
            child: ClipOval(
              child: Image.asset('images/image1.png'
              ),
            ),
          ),
        ),
     ),
    );
  }
}