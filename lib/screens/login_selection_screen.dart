import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardStyle = BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(colors: [Colors.white.withOpacity(0.95), Colors.white.withOpacity(0.85)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0,6))],
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 38),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFE8F5E9), Colors.white], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Welcome to', style: GoogleFonts.openSans(fontSize: 16, color: Colors.grey[700])),
            SizedBox(height: 6),
            Text('My Village', style: GoogleFonts.poppins(fontSize: 34, fontWeight: FontWeight.w700, color: Colors.green[800])),
            SizedBox(height: 18),
            Text('Choose how you want to enter', style: GoogleFonts.openSans(color: Colors.grey[800])),
            SizedBox(height: 26),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/user-login'),
              child: Container(
                height: 140,
                decoration: cardStyle,
                padding: EdgeInsets.all(14),
                child: Row(
                  children: [
                    Container(
                      width: 84, height: 84,
                      decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(16)),
                      child: Icon(Icons.person, size: 46, color: Colors.green[700]),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text('User Login', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
                        SizedBox(height: 6),
                        Text('View news, gallery and contacts.', style: GoogleFonts.openSans(color: Colors.grey[700])),
                        SizedBox(height: 8),
                        Align(alignment: Alignment.bottomRight, child: Text('Tap to continue →', style: GoogleFonts.openSans(color: Colors.green[800])))
                      ]),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 18),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/admin-login'),
              child: Container(
                height: 140,
                decoration: cardStyle,
                padding: EdgeInsets.all(14),
                child: Row(
                  children: [
                    Container(
                      width: 84, height: 84,
                      decoration: BoxDecoration(color: Colors.green[800], borderRadius: BorderRadius.circular(16)),
                      child: Icon(Icons.admin_panel_settings, size: 44, color: Colors.white),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text('Admin Login', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
                        SizedBox(height: 6),
                        Text('Manage posts, gallery and contacts.', style: GoogleFonts.openSans(color: Colors.grey[700])),
                        SizedBox(height: 8),
                        Align(alignment: Alignment.bottomRight, child: Text('Tap to manage →', style: GoogleFonts.openSans(color: Colors.green[800])))
                      ]),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Center(child: Text('Made with ♥ for your village', style: GoogleFonts.openSans(color: Colors.grey[600]))),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
