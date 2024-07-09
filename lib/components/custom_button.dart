

import 'package:app_form/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      minimumSize:const Size(double.infinity, 45),
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      )
    ),
     child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)));
  }
}