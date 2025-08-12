import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLoginScreen extends StatefulWidget {
  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final TextEditingController emailController = TextEditingController(text: 'user@village.com');
  final TextEditingController passwordController = TextEditingController(text: '1234');
  bool loading = false;

  void _login() async {
    setState(() => loading = true);
    await Future.delayed(Duration(milliseconds: 600));
    setState(() => loading = false);
    if (emailController.text.trim() == 'user@village.com' && passwordController.text.trim() == '1234') {
      Navigator.pushReplacementNamed(context, '/user-home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid user credentials')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Login', style: GoogleFonts.poppins())),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            SizedBox(height: 8),
            Text('Welcome back', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
            SizedBox(height: 6),
            Text('Login to explore village updates', style: GoogleFonts.openSans(color: Colors.grey[700])),
            SizedBox(height: 18),
            CustomTextField(label: 'Email', controller: emailController, keyboardType: TextInputType.emailAddress),
            SizedBox(height: 12),
            CustomTextField(label: 'Password', controller: passwordController, isPassword: true),
            SizedBox(height: 18),
            ElevatedButton(
              onPressed: loading ? null : _login,
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48), shape: StadiumBorder()),
              child: loading ? CircularProgressIndicator(color: Colors.white) : Text('Login', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 12),
            TextButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Forgot password not implemented'))), child: Text('Forgot password?')),
          ],
        ),
      ),
    );
  }
}
