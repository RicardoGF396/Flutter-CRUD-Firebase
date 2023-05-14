import 'package:flutter/material.dart';

class DefaultInput extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;

  DefaultInput({
    required this.hintText,
    required this.labelText,
    this.validator,
    this.onChanged,
    required this.obscureText,
  });

  @override
  _DefaultInputState createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Color(0xFF3D3C46)),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF1E1C24),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Color(0xFF3D3C46)),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Color(0xFF3D3C46)),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
