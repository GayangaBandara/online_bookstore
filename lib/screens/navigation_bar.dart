import 'package:flutter/material.dart';
import 'package:online_bookstore/screens/book_list.dart';
import 'package:online_bookstore/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'package:online_bookstore/screens/profile.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    BookListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(169, 191, 190, 247), // AppBar background color
        title: Text(
          'Online Bookstore',
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)), // Title text color
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: const Color.fromARGB(255, 0, 0, 0), // Icon color
            ),
            onSelected: (value) {
              if (value == 'Profile') {
                _onItemTapped(2);
              } else if (value == 'Cart') {
                _onItemTapped(1);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Profile',
                child: Text('Profile', style: TextStyle(color: Colors.deepPurple)), // Menu item color
              ),
              PopupMenuItem(
                value: 'Cart',
                child: Text('Cart', style: TextStyle(color: Colors.deepPurple)), // Menu item color
              ),
            ],
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color.fromARGB(169, 191, 190, 247), // BottomNavigationBar background color
        selectedItemColor: Color.fromRGBO(65, 106, 168, 1), // Selected icon and label color
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0), // Unselected icon and label color
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
