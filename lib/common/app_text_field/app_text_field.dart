import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextStyle style;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  // final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController controller;
  final String errorText;
  final Widget prefix;
  final Widget suffix;
  final bool password;
  final enabled;

  AppTextField(
      {this.label,
      this.style,
      this.textAlign,
      this.keyboardType,
      // this.validator,
      this.controller,
      this.inputFormatters,
      this.errorText,
      this.password = false,
      this.prefix,
      this.suffix,
      this.enabled = true,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      keyboardType: keyboardType,
      maxLines: 10,
      obscureText: password,
      textAlign: textAlign,
      style: style,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      inputFormatters: inputFormatters,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        labelText: label,
        errorText: errorText,
        prefixIcon: prefix,
        suffixIcon: suffix,
        labelStyle: TextStyle(
          fontSize: 21,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      enabled: enabled, // Modificar
      onChanged: onChanged,
    );
  }
}
