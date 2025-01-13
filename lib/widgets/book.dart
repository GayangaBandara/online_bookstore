import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String title;
  final String author;
  final String price;
  final String imagePath;
  final String description;

  const BookWidget({
    super.key,
    required this.title,
    required this.author,
    required this.price,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 145, 163, 245), // Light blue background for the bookstore
      child: Card(
        margin: EdgeInsets.all(5),
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
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic, // Author name in italic
                  color: const Color.fromARGB(255, 76, 144, 247),
                ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centers the items
                children: <Widget>[
                  Text(
                    price,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20, height: 50), // Adds spacing between price and button
                  SizedBox(
                    width: 120, // Set button width
                    height:30, // Set button height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(202, 255, 255, 255), // Button color
                      ),
                      onPressed: () {
                        // Add to cart functionality here
                      },
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Bold text for button
                          fontSize: 14, // Slightly increased font size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
