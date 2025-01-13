import 'package:flutter/material.dart';
import 'screens/book_list.dart';

void main() {
  runApp(OnlineBookStoreApp());
}

// ignore: use_key_in_widget_constructors
class OnlineBookStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Bookstore',
      debugShowCheckedModeBanner: false, // Removes the DEBUG banner
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookListScreen(),
    );
  }
}
