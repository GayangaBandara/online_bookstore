import 'package:flutter/material.dart';
import 'screens/book_list.dart';
import 'screens/navigation_bar.dart';
import 'providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: OnlineBookStoreApp(),
    ),
  );
}

class OnlineBookStoreApp extends StatelessWidget {
  const OnlineBookStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Bookstore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationBarScreen(),
    );
  }
}
