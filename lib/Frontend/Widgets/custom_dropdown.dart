import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String labelText;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    required this.value,
    required this.items,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField<String>(
        value: value,
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff20b2aa),
            ),
          ),
          // Custom icon to the right of the dropdown
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
