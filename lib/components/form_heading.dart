import 'package:flutter/material.dart';

class FormHeading extends StatelessWidget {
  const FormHeading({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    );
  }
}
