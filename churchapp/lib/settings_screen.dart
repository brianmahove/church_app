import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart'; // Ensure to import the main.dart file to access ThemeProvider
import 'bottom_navigation_bar.dart'; // Import the custom navigation bar

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Sign In'),
            onTap: () {
              // Navigate to Sign In screen
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Change Language'),
            onTap: () {
              // Implement language change functionality
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Create Account'),
            onTap: () {
              // Navigate to Create Account screen
            },
          ),
          const Divider(),
          const Text(
            'Copyright © brianmahove2024. Powered by Vizion',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
          currentIndex: 3), // Use the custom navigation bar
    );
  }
}
