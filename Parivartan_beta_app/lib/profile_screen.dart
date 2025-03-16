import 'package:flutter/material.dart';
// import 'package:untitled3/userpage.dart';
import 'package:untitled3/welcome_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String mainProfileImage = 'assets/images/avtar.webp'; // Placeholder
  String backgroundImage = 'assets/images/background.jpeg'; // Placeholder

  String name = "John Doe";
  String email = "john.doe@example.com";
  int age = 21;
  String gender = "Male";
  String studentClass = "12th Grade";
  String address = "123 Main St, City, Country";
  String role = "Student";
  String schoolName = "ABC High School";
  String certification = "Certified in Flutter Development";
  String skills = "Dart, Flutter, Firebase, Node.js";

  // Function to log out and redirect to the welcome screen
  void logout() {
    // Replace Navigator.pushReplacementNamed with Navigator.pushReplacement for the updated code
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()), // Redirect to WelcomeScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image Section
            Stack(
              alignment: Alignment.center,
              children: [
                // Background image
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(backgroundImage),
                ),
                // Main profile image
                Positioned(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(mainProfileImage),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Student Information Section
            ListView(
              shrinkWrap: true,
              children: [
                _buildInfoRow("Name", name),
                _buildInfoRow("Email", email),
                _buildInfoRow("Age", age.toString()),
                _buildInfoRow("Gender", gender),
                _buildInfoRow("Class", studentClass),
                _buildInfoRow("Address", address),
                _buildInfoRow("Role", role),
                _buildInfoRow("School Name", schoolName),
                _buildInfoRow("Certification", certification),
                _buildInfoRow("Skills", skills),
              ],
            ),
            SizedBox(height: 20),
            // Logout Button
            ElevatedButton(
              onPressed: logout,
              child: Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
