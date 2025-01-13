import 'package:flutter/material.dart';
import '../widgets/book.dart';

class BookListScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'Sandstorm',
      'author': 'James Rollins',
      'price': '1450',
      'image': 'assets/images/book1.jpg',
      'description': 'A heart-stopping novel of adventure and suspense from #1 New York Times bestselling author James Rollins—the first in his critically acclaimed Sigma Force series A freak explosion in the British Museum in London ignites a perilous race for an earth-shaking power source buried deep beneath the sands of history. Painter Crowe is an agent for Sigma Force, a covert arm of the Defense Department tasked with keeping dangerous scientific discoveries out of enemy hands. When an ancient artifact points the way toward the legendary "Atlantis of the Sands," Painter must travel across the world in search of the lost city and a destructive power beyond imagining.'
    },
    {
      'title': 'Book 2',
      'author': 'Author 2',
      'price': '1250',
      'image': 'assets/images/book2.jpg',
      'description': 'This is the description of Book 2.'
    },
    {
      'title': 'Book 3',
      'author': 'Author 3',
      'price': '1500',
      'image': 'assets/images/book3.jpg',
      'description': 'This is the description of Book 3.'
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Bookstore'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookWidget(
            title: books[index]['title']!,
            author: books[index]['author']!,
            price: books[index]['price']!,
            imagePath: books[index]['image']!,
            description: books[index]['description']!,
          );
        },
      ),
    );
  }
}
