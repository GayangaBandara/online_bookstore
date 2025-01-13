import 'package:flutter/material.dart';
import '../widgets/book.dart';

class BookListScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'Book 1',
      'author': 'Author 1',
      'price': '\$10',
      'image': 'assets/images/book1.jpg',
      'description': 'This is the description of Book 1.'
    },
    {
      'title': 'Book 2',
      'author': 'Author 2',
      'price': '\$12',
      'image': 'assets/images/book2.jpg',
      'description': 'This is the description of Book 2.'
    },
    {
      'title': 'Book 3',
      'author': 'Author 3',
      'price': '\$15',
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
