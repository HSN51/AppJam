import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final String url;
  final String name;
  final String description;

  CardContainer({required this.url, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(name: name, description: description),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        color: Colors.white,
        margin: EdgeInsets.all(16.0),
        child: Container(
          height: 200.0, // Adjust height as needed
          width: 300,
          child: Image.asset(url), // Use the provided image URL
        ),
      ),
    );
  }
}



class DetailPage extends StatefulWidget {
  final String name;
  final String description;

  DetailPage({required this.name, required this.description});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController _commentController = TextEditingController();
  List<String> _comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              widget.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Enter your comment...',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _comments.add(_commentController.text);
                  _commentController.clear();
                  // Close the keyboard
                  FocusScope.of(context).unfocus();
                });
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            Text(
              'Comments:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_comments[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
