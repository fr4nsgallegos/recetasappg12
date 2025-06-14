import 'package:flutter/material.dart';

class FormItemWidget extends StatelessWidget {
  TextEditingController controller;
  String hint;
  IconData iconData;
  int maxLines;

  FormItemWidget({
    required this.controller,
    required this.hint,
    required this.iconData,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        style: TextStyle(color: Colors.white),
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          prefixIcon: Icon(iconData, color: Colors.white),
          // iconColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.black.withOpacity(0.35),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
