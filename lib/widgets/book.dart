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
      color: const Color.fromARGB(255, 125, 152, 153),
      child: Card(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('by $author', style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: const Color.fromARGB(255, 48, 93, 119))),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(title),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(imagePath, height: 200, fit: BoxFit.cover),
                          SizedBox(height: 10),
                          Text(description, style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Close'),
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
                Text(price, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false).addToCart({
                      'title': title,
                      'author': author,
                      'price': price,
                      'image': imagePath,
                      'description': description,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$title added to cart!')),
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
