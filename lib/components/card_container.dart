import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.white,
      margin: EdgeInsets.all(16.0),
      child: Container(
        height: 200.0, // Adjust height as needed
        width: 300,
        child: Image.network('https://image.hurimg.com/i/hurriyet/75/0x0/5c0d246dc03c0e15a49c546a.jpg'), // You can replace Placeholder with your image widget
      ),
    );
  }
}
