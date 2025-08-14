import 'package:flutter/material.dart';
import 'domain_login_page.dart';

class DomainSignupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  DomainSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Text('Domain Sign Up', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Register as a domain user', style: TextStyle(fontSize: 16, color: Colors.black54)),
                    const SizedBox(height: 32),

                    TextField(controller: nameController, decoration: _inputDecoration('Full Name')),
                    const SizedBox(height: 16),

                    TextField(controller: emailController, decoration: _inputDecoration('Email')),
                    const SizedBox(height: 16),

                    TextField(controller: passwordController, obscureText: true, decoration: _inputDecoration('Password')),
                    const SizedBox(height: 16),

                    TextField(controller: confirmPasswordController, obscureText: true, decoration: _inputDecoration('Confirm Password')),
                    const SizedBox(height: 24),

                    // Green styled sign-up button
                    _greenButton('Sign Up', () {
                      // TODO: Add domain signup logic
                    }),

                    const SizedBox(height: 32),

                    // Link to Domain Sign In
                    _bottomText("Already have an account? ", "Sign in", () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => DomainLoginPage()),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // Back button
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => DomainLoginPage()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) => InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.lightBlue[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      );

  Widget _greenButton(String text, VoidCallback onTap) => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          onPressed: onTap,
          child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ),
      );

  Widget _bottomText(String text, String linkText, VoidCallback onTap) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          GestureDetector(
            onTap: onTap,
            child: Text(
              linkText,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
}
