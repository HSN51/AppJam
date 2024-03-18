import 'package:flutter/material.dart';
import '/components/bottom_navigation.dart'; // Import your BottomNavigation widget

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blue, // Set the background color of AppBar to blue
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('Notifications'),
              trailing: Switch(
                value: true, // Example value, replace with actual value
                onChanged: (bool value) {
                  // Implement your logic for handling notifications
                },
              ),
            ),
            ListTile(
              title: Text('Dark Mode'),
              trailing: Switch(
                value: false, // Example value, replace with actual value
                onChanged: (bool value) {
                  // Implement your logic for handling dark mode
                },
              ),
            ),
            ListTile(
              title: Text('Language'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to language settings page
              },
            ),
            ListTile(
              title: Text('Profile'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to profile settings page
              },
            ),
            ListTile(
              title: Text('About'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to about page
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(), // Replace with your BottomNavigation widget
    );
  }
}
