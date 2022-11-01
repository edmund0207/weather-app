import 'package:flutter/material.dart';
import 'package:weather/constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF171829),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'username',
              style: kButtonTextStyle,
            ),
            accountEmail: const Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/profile_picture.jpg'),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('images/weather_bg.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          SingleChildScrollView(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.favorite, color: Colors.white),
                  title: Text('Favorite location', style: kNavBarTextStyle),
                ),
                ListTile(
                  leading: Icon(Icons.share, color: Colors.white),
                  title: Text('Share', style: kNavBarTextStyle),
                ),
                ListTile(
                  leading: Icon(Icons.people, color: Colors.white),
                  title: Text('Invite Friends', style: kNavBarTextStyle),
                ),
                ListTile(
                  leading: Icon(Icons.report, color: Colors.white),
                  title: Text('Report wrong location', style: kNavBarTextStyle),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text('Settings', style: kNavBarTextStyle),
                ),
                ListTile(
                  leading: Icon(Icons.help, color: Colors.white),
                  title: Text('How to use', style: kNavBarTextStyle),
                ),
                ListTile(
                  leading: Icon(Icons.headset_mic, color: Colors.white),
                  title: Text('Contact us', style: kNavBarTextStyle),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app_sharp, color: Colors.white),
                  title: Text('Exit', style: kNavBarTextStyle),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
