import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mabesal/pages/splash_screen.dart';

void main() {
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {
  LoginUiApp({super.key});

  final Color _primaryColor = HexColor('#2E4598');
  final Color _accentColor = HexColor('#2E4598');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Personil',
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: _accentColor),
        primarySwatch: Colors.grey
      ),
      home: const SplashScreen(title: 'DISINFOLAHTAL'),
    );
  }
}


