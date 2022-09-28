import 'package:flutter/material.dart';
import 'package:mabesal/pages/profile_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(),
          _drawerItem(
              icon: Icons.person,
              text: 'My Profile',
              onTap: () {Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> (const ProfilePage())));
              }
          ),
          const Divider(height: 25, thickness: 1),
          _drawerItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () => ('Tap Family menu'),
          ),
          const Divider(height: 25, thickness: 1),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return const UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
          image: AssetImage('images/image1.png'), fit: BoxFit.cover),
    ),
    accountName: Text('Ahmad Daffa Maulani'),
    accountEmail: Text('masche@gmail.com'),
  );
}

Widget _drawerItem({IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}