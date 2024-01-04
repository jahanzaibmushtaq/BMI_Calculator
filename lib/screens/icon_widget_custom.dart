import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key, required this.title, required this.icon
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0,),
        const SizedBox(height: 15.0,),
        Text(title, style: const TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0),)
      ],
    );
  }
}