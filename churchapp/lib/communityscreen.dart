import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart'; // Ensure to import the main.dart file to access ThemeProvider
import 'bottom_navigation_bar.dart'; // Import the custom navigation bar

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.forum),
            title: const Text('General Discussion'),
            onTap: () {
              // Navigate to General Discussion screen
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Share the Word'),
            onTap: () {
              // Navigate to Share the Word screen
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.support),
            title: const Text('Prayer Requests'),
            onTap: () {
              // Navigate to Prayer Requests screen
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.music_note),
            title: const Text('Worship Songs'),
            onTap: () {
              // Navigate to Worship Songs screen
            },
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
          currentIndex: 2), // Use the custom navigation bar
    );
  }
}
