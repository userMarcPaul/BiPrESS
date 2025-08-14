import 'package:flutter/material.dart';
import 'admin_signup_page.dart';
import 'role_selection_page.dart';

class AdminLoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AdminLoginPage({super.key});

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
                    const Text('Admin Login', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Hi Administrator! Continue to log in',
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                    const SizedBox(height: 32),

                    TextField(controller: emailController, decoration: _inputDecoration('Email')),
                    const SizedBox(height: 16),

                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: _inputDecoration('Password').copyWith(
                        suffixIcon: TextButton(
                          onPressed: () {
                            // TODO: forgot password
                          },
                          child: const Text('Forgot Password', style: TextStyle(fontSize: 12, color: Colors.blue)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    _greenButton('Sign In', () {
                      // TODO: sign in logic
                    }),

                    const SizedBox(height: 24),
                    _socialLogin(),
                    const SizedBox(height: 32),

                    _bottomText("Don’t have an account? ", "Sign up", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AdministratorSignupPage()),
                      );
                    }),
                  ],
                ),
              ),
            ),
            // Back button to Role Selection Page
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => RoleSelectionPage()),
                  );
                },
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

  Widget _socialLogin() => Column(
        children: [
          Row(
            children: const [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text("Or Sign in with"),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/google.png', width: 36),
              const SizedBox(width: 30),
              Image.asset('assets/icons/facebook.png', width: 36),
              const SizedBox(width: 30),
              Image.asset('assets/icons/apple.png', width: 36),
            ],
          ),
        ],
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
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      );
}
