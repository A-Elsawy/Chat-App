import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  const CustomButton({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text!,
          style: const TextStyle(
            color: Color(0xFF2B475E),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
