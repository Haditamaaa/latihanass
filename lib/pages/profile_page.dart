import 'package:flutter/material.dart';

import '../common/drawer_helper.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary]
            )
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(top: 16, right: 16),
            child: Stack(
              children: const [
                Icon(Icons.person_pin),
              ],
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
    );
  }
}
