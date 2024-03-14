import 'package:flutter/material.dart';
import 'package:q_copy/styles/google_fonts.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Message Screen",
          style: latoW,
        ),
      ),
    );
  }
}
