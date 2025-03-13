import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  AddTextField({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        TextField(controller: controller),
        SizedBox(height: 16),
      ],
    );
  }
}
