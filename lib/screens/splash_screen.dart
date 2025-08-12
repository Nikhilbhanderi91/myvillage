import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinished;
  SplashScreen({required this.onFinished});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    _ctrl.forward();
    Timer(Duration(seconds: 2), widget.onFinished);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF2BB673), Color(0xFF0B8F74)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: ScaleTransition(
            scale: Tween(begin: 0.8, end: 1.0).animate(CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.12), shape: BoxShape.circle, boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26, offset: Offset(0,4))]),
                  child: Icon(Icons.location_city, size: 64, color: Colors.white),
                ),
                SizedBox(height: 18),
                Text('My Village', style: GoogleFonts.poppins(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600)),
                SizedBox(height: 6),
                Text('Connect • Share • Grow', style: GoogleFonts.openSans(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
