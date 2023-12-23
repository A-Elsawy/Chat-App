import 'package:flutter/material.dart';

void showSnakeBar(ScaffoldMessengerState message, String text) {
  message.showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
