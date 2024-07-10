import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class DefaultTextField extends StatelessWidget {
  String label;
  String? initialValue;
  String? errorText;
  TextInputType? textInputType;
  IconData icon;
  Color? color;
  Function(String text) onChanged;
  String? Function(String?)? validator; //validar formulario
  bool obscureText;

  DefaultTextField({
    Key? key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.obscureText = false,
    this.errorText,
    this.validator,
    this.initialValue,
    this.color = Colors.white,
    textInputType = TextInputType.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      initialValue: initialValue, //pasar el valor
      onChanged: (texto) {
        onChanged(texto);
      },
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: color),
        ),
        errorText: errorText,
        prefixIcon: Icon(
          icon,
          color: color,
        ),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color!)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color!)),
      ),
      style: TextStyle(color: color),
    );
  }
}
