import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminLoginScreen extends StatefulWidget {
  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final TextEditingController usernameController = TextEditingController(text: 'admin');
  final TextEditingController passwordController = TextEditingController(text: 'admin123');
  bool loading = false;

  void _login() async {
    setState(() => loading = true);
    await Future.delayed(Duration(milliseconds: 600));
    setState(() => loading = false);
    if (usernameController.text.trim() == 'admin' && passwordController.text.trim() == 'admin123') {
      Navigator.pushReplacementNamed(context, '/admin-dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid admin credentials')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Login', style: GoogleFonts.poppins())),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            SizedBox(height: 8),
            Text('Hello Admin', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
            SizedBox(height: 6),
            Text('Manage your village content', style: GoogleFonts.openSans(color: Colors.grey[700])),
            SizedBox(height: 18),
            CustomTextField(label: 'Username', controller: usernameController),
            SizedBox(height: 12),
            CustomTextField(label: 'Password', controller: passwordController, isPassword: true),
            SizedBox(height: 18),
            ElevatedButton(
              onPressed: loading ? null : _login,
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48), shape: StadiumBorder(), backgroundColor: Colors.green[800]),
              child: loading ? CircularProgressIndicator(color: Colors.white) : Text('Login', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
