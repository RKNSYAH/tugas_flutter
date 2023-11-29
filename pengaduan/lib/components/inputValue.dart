import 'package:flutter/material.dart';

class InputValue extends StatelessWidget {
  const InputValue({
    super.key,
    required this.onSubmitted,
    required this.label,
    this.initval,
  });

  final Function(String value) onSubmitted;
  final String label;
  final String? initval;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onSubmitted,
      initialValue: initval,
      decoration: InputDecoration(labelText: label),
    );
  }
}
