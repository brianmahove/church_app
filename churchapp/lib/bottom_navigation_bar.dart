import 'package:churchapp/CommunityScreen.dart';
import 'package:churchapp/post_page.dart';
import 'package:churchapp/settings_screen.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue, // Adjust colors as needed
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(
        color: Colors.blue,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.blue,
            offset: Offset(0, 0),
          ),
        ],
      ),
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            );
            break;
          case 1:
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const PostPage()),
              (route) => false,
            );
            break;
          case 2:
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const CommunityScreen()),
              (route) => false,
            );
            break;
          case 3:
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SettingScreen()),
              (route) => false,
            );
            break;
          default:
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
