import 'package:flutter/material.dart';

import 'admin_login_page.dart'; // ✔ must contain class AdminLoginPage
import 'domain_login_page.dart'; // ✔ must contain class DomainLoginPage
import 'client_login_page.dart'; // ✔ must contain class ClientLoginPage

class RoleSelectionPage extends StatelessWidget {
  RoleSelectionPage({super.key});

  final List<Map<String, dynamic>> roles = [
    {'name': 'Administrator', 'page': AdminLoginPage()},
    {'name': 'Domains', 'page': DomainLoginPage()},
    {'name': 'Client', 'page': ClientLoginPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/bipsulogo.jfif', width: 100, height: 100),
                  const SizedBox(height: 20),
                  const Text(
                    'Booking System For Biliran Creative Industries With',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Recommendation Algorithm',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Role Buttons
                  ...roles.map(
                    (role) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => role['page']),
                            );
                          },
                          child: Text(
                            role['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
