import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mabesal/common/theme_helper.dart';
import 'package:mabesal/pages/beranda.dart';
import 'package:mabesal/pages/registration_page.dart';

import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Key _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 80.0,
                left: 22.0,
                right: 15.00,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset('images/image1.png',
                      width: 131, height: 115,),
                  const Spacer(),
                  const Text(
                    'Welcome,\nDISINFOLAHTAL',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 29,
                      fontFamily: 'PoppinsExtraBoldItalic',
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextField(
                            decoration: ThemeHelper().textInputDecoration('Username', 'Enter Your Username'),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration('Password', 'Enter Your Password'),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(30, 14, 30, 14),
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                                );
                              },
                              child: const Text('Forgot Password?', style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60.0,
                          ),
                          Container(
                            decoration: ThemeHelper().buttonBoxDecoration(context),
                            child:ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(30, 14, 30, 14),
                                child: Text('Login'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // After login redirect to profile page
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) => const BerandaPage())
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(30, 14, 30, 14),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: "Don't have an account? "),
                                  TextSpan(
                                    text: 'Register',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
                                      },
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
                                  ),
                                ]
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
