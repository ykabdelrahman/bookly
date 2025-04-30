import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.controller,
  });

  final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      autofocus: true,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: WidgetStateColor.resolveWith(
          (states) =>
              states.contains(WidgetState.focused) ? Colors.grey : Colors.white,
        ),
        hintText: 'Search for a book..',
        focusedBorder: borderStyle(),
        enabledBorder: borderStyle(),
        border: borderStyle(),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
