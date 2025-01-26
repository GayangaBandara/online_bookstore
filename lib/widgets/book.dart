import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

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
      color: const Color.fromARGB(255, 177, 219, 224), // Changed main container background color
      child: Card(
        color: const Color.fromARGB(
            210, 255, 255, 255), // Changed card background color
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(232, 0, 0, 0))), // Changed title text color
            Text(
              'by $author',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: const Color.fromARGB(
                    255, 56, 116, 206), // Changed author text color
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Changed dialog background color
                    title: Text(title,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 129, 150, 172))), // Changed dialog title text color
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(imagePath,
                              height: 200, fit: BoxFit.cover),
                          SizedBox(height: 10),
                          Text(description,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: const Color.fromARGB(255, 77, 77,
                                      77))), // Changed description text color
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Close',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 12, 12, 12))), // Changed close button text color
                      ),
                    ],
                  ),
                );
              },
              child: Image.asset(imagePath, height: 250, fit: BoxFit.cover),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  price,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 10, 10, 10)), // Changed price text color
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 14, 14, 14),
                    backgroundColor: const Color.fromARGB(255, 171, 194, 216), // Changed button text color
                  ),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart({
                      'title': title,
                      'author': author,
                      'price': price,
                      'image': imagePath,
                      'description': description,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$title added to cart!',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255,
                                    255))), // Changed snackbar text color
                        backgroundColor: const Color.fromARGB(255, 0, 51,
                            102), // Changed snackbar background color
                      ),
                    );
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
