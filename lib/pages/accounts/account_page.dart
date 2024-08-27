import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Account Settings',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            SizedBox(height: 20),
            _buildMenuItem(Icons.person, 'Profile', () {
              // Navigate to profile screen
            }),
            _buildMenuItem(Icons.history, 'Order History', () {
              // Navigate to order history screen
            }),
            _buildMenuItem(Icons.payment, 'Payment Methods', () {
              // Navigate to payment methods screen
            }),
            _buildMenuItem(Icons.security, 'Security Settings', () {
              // Navigate to security settings screen
            }),
            _buildMenuItem(Icons.help, 'Help & Support', () {
              // Navigate to help and support screen
            }),
            SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'assets/profile_picture.png'), // Update with actual image
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800]),
              ),
              SizedBox(height: 4),
              Text(
                'johndoe@example.com',
                style: TextStyle(color: Colors.blueGrey[600]),
              ),
              SizedBox(height: 4),
              Text(
                'Employee ID: 12345',
                style: TextStyle(color: Colors.blueGrey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey[700]),
      title: Text(title,
          style: TextStyle(fontSize: 16, color: Colors.blueGrey[800])),
      onTap: onTap,
    );
  }
}
