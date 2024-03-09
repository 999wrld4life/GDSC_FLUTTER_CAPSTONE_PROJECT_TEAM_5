import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final bool isBool;
  final IconData icon;
  final String text;

  const MyTextField({
    Key? key,
    required this.isBool,
    required this.icon,
    required this.text,
    this.controller,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autocorrect: !widget.isBool,
      enableSuggestions: !widget.isBool,
      obscureText: widget.isBool ? _obscureText : false,
      keyboardType: widget.isBool
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.black.withOpacity(0.9),
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: Colors.black,
        ),
        suffixIcon: widget.isBool
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        labelText: widget.text,
        labelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
              width: 0, style: BorderStyle.solid, color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
