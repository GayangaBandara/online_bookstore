import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        // Make the body scrollable
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information Section
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/135960353?v=4'), // Replace with dynamic image
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Gayanga_Bandara', // Replace with dynamic name
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'gayangabandara20@gmail.com', // Replace with dynamic email
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Order History Section
            const Text(
              'Order History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Example Order List
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2, // Replace with dynamic count of orders
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text('Order #IMB$index'),
                    subtitle:
                        Text('Order Date: 2025-01-25\nSummary: Book 1, Book 2'),
                    onTap: () {
                      // Show order details or navigate to order details screen
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Wishlist Section
            const Text(
              'Wishlist',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2, // Replace with dynamic count of wishlist items
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text('Book Title $index'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Remove book from wishlist
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Addresses Section
            const Text(
              'Addresses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Shipping Address'),
              subtitle: const Text('SLTC, Meepe, Colombo'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Edit address functionality
                },
              ),
            ),
            const SizedBox(height: 20),

            // Payment Methods Section
            const Text(
              'Payment Methods',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Visa **** **** **** 1234'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Remove payment method functionality
                },
              ),
            ),
            const SizedBox(height: 20),

            // Notifications Section
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2, // Replace with dynamic count of notifications
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text('Notification $index'),
                    subtitle: const Text('Your order has shipped!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
