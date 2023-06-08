import 'package:flutter/material.dart';

class DefaultDropdown extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final List<String> items;
  final String? value;
  final TextEditingController? controller; // Agrega un parámetro para el controlador

  DefaultDropdown({
    required this.hintText,
    required this.labelText,
    this.validator,
    this.onChanged,
    required this.items,
    this.value,
    this.controller, // Actualiza el constructor para aceptar el controlador
  });

  @override
  _DefaultDropdownState createState() => _DefaultDropdownState();
}

class _DefaultDropdownState extends State<DefaultDropdown> {
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.value ?? widget.controller?.text; // Verifica si se proporciona un valor o utiliza el valor del controlador
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedItem,
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item, style: TextStyle(color: Colors.white)),
        );
      }).toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF1E1C24),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Color(0xFF3D3C46)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF3D3C46)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF3D3C46)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF3D3C46)),
        ),
      ),
      style: TextStyle(color: Colors.white),
      dropdownColor: Colors.black,
      validator: widget.validator,
      onChanged: (String? value) {
        setState(() {
          _selectedItem = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value!);
        }
        if (widget.controller != null) { // Actualiza el valor del controlador
          widget.controller!.text = value ?? '';
        }
      },
    );
  }
}
