import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '/components/bottom_navigation.dart'; // Import your BottomNavigation widget

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? favoritePlace;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    try {
      String jsonData = await rootBundle.loadString('assets/data.json');
      List<dynamic> jsonList = json.decode(jsonData);
      if (jsonList.isNotEmpty) {
        setState(() {
          favoritePlace = jsonList[0];
        });
      }
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  radius: 40.0, // Reduce the radius
                ),
                SizedBox(height: 8.0),
                Text(
                  'Durukan Çoban',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Adjust the font size
                ),
                SizedBox(height: 4.0),
                Text(
                  'Software Developer',
                  style: TextStyle(fontSize: 14, color: Colors.grey), // Adjust the font size
                ),
                if (favoritePlace != null) ...[
                  SizedBox(height: 16.0),
                  Text(
                    'Favorite Place:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Adjust the font size
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    favoritePlace!['name'],
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500), // Adjust the font size
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    favoritePlace!['description'],
                    style: TextStyle(fontSize: 14), // Adjust the font size
                  ),
                  SizedBox(height: 8.0),
                  Image.asset(
                    favoritePlace!['url'],
                    width: 200, // Adjust the image width
                    height: 300, // Adjust the image height
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(), // Replace with your BottomNavigation widget
    );
  }
}
