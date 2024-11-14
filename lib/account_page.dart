// account_page.dart
import 'package:flutter/material.dart';
import 'styles.dart';
import 'login_screen.dart'; // Import the LoginScreen

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('asset/image/hisyam.png'), // Path to your custom image
              ),
            ),
            const SizedBox(height: 16.0),

            // Name
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Name'),
              subtitle: const Text('Zahra Hisyam'), // Replace with actual name data
            ),
            const Divider(),

            // Email
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: const Text('zahra.hisyam@itenas.mhs.ac.id'), // Replace with actual email data
            ),
            const Divider(),

            // Phone Number
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone Number'),
              subtitle: const Text('+6289637367544'), // Replace with actual phone number
            ),
            const Divider(),

            // Address
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Address'),
              subtitle: const Text('Bandung'), // Replace with actual address
            ),
            const Divider(),

            // Edit Profile Button
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality to edit profile
                },
                child: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue, // Customize button color
                  foregroundColor: Colors.white, // Customize text color
                ),
              ),
            ),

            // Logout Button
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the LoginScreen when logout is pressed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue, // Customize button color
                  foregroundColor: Colors.white, // Set text color to white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
