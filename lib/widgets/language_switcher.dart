import 'package:flutter/material.dart';
import 'package:myvillage/constants/colors.dart';

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  bool _isEnglish = true;

  void _switchLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isEnglish ? 'Language changed to English' : 'ભાષા ગુજરાતીમાં બદલાઈ'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.language,
        color: Colors.white,
        size: 28,
      ),
      onPressed: _switchLanguage,
      tooltip: _isEnglish ? 'Switch to Gujarati' : 'અંગ્રેજીમાં બદલો',
    );
  }
}