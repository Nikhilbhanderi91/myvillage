import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _index = 0;
  final List<_OnboardItem> items = [
    _OnboardItem(title: 'Welcome to My Village', subtitle: 'Discover local news, events and people.', icon: Icons.home),
    _OnboardItem(title: 'Share Photos', subtitle: 'A beautiful gallery of village life and festivals.', icon: Icons.photo_library),
    _OnboardItem(title: 'Stay Connected', subtitle: 'Important contacts and emergency numbers.', icon: Icons.phone_in_talk),
  ];

  void _finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    Navigator.of(context).pushReplacementNamed('/login-selection');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF56CCF2), Color(0xFF2BB673)], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: items.length,
              itemBuilder: (c, idx, realIdx) {
                final it = items[idx];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.all(22),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(radius: 40, backgroundColor: Colors.green.shade100, child: Icon(it.icon, size: 44, color: Colors.green.shade700)),
                          SizedBox(height: 16),
                          Text(it.title, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
                          SizedBox(height: 10),
                          Text(it.subtitle, textAlign: TextAlign.center, style: GoogleFonts.openSans(color: Colors.grey[700])),
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 340,
                enlargeCenterPage: true,
                onPageChanged: (i, _) => setState(() => _index = i),
                autoPlay: false,
              ),
            ),
            SizedBox(height: 18),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(items.length, (i) => _buildDot(i == _index))),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
              child: Row(
                children: [
                  TextButton(onPressed: _finish, child: Text('Skip', style: TextStyle(color: Colors.white70))),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), shape: StadiumBorder(), backgroundColor: Colors.white),
                    onPressed: _index == items.length - 1 ? _finish : () => setState(() => _index = (_index + 1) % items.length),
                    child: Text(_index == items.length - 1 ? 'Get Started' : 'Next', style: TextStyle(color: Colors.green[800])),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(bool active) {
    return AnimatedContainer(duration: Duration(milliseconds: 250), margin: EdgeInsets.symmetric(horizontal: 6), width: active ? 18 : 8, height: 8, decoration: BoxDecoration(color: active ? Colors.white : Colors.white54, borderRadius: BorderRadius.circular(6)));
  }
}

class _OnboardItem {
  final String title;
  final String subtitle;
  final IconData icon;
  _OnboardItem({required this.title, required this.subtitle, required this.icon});
}
