import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String title;
  final String author;
  final String price;
  final String imagePath;
  final String description;

  BookWidget({
    required this.title,
    required this.author,
    required this.price,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Centering title
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'by $author',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center, // Centering author name
            ),
          ),
          GestureDetector(
            onTap: () {
              // Show the description when the image is clicked
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(title),
                  content: Text(description),
                  actions: [
                    TextButton(
                      child: Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            child: Image.asset(
              imagePath,
              height: 250, // Adjusted height for portrait mode
              width: 150, // Adjusted width for centered display
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Centering price
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Add to cart functionality here
              },
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
