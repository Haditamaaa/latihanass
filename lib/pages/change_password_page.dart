import 'package:flutter/material.dart';
import 'package:mabesal/pages/profile_page.dart';

import '../common/theme_helper.dart';

class ChangePasswordPage extends StatefulWidget{
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.fromLTRB(20, 80, 20, 0),
              child: Image.asset('images/image1.png',
              height: 198, width: 197,
              ),
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
                          TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Username', 'Enter Your Username'),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(' New Password', 'Enter Your Password'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter new password";
                              }
                              return null;
                            }
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration('Re-Password', 'Enter Your Re-Password'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please re-enter new password";
                              }
                              return null;
                            },
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
                                child: Text('Submit'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => const ProfilePage()
                                      ),
                                          (Route<dynamic> route) => false
                                  );
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
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
