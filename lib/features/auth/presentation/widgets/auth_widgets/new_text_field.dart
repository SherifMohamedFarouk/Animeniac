import 'package:flutter/material.dart';

class NewTextField extends StatefulWidget {
  const NewTextField({
    required this.hint,
    required this.label,
    Key? key,
    this.validator,
    this.onchanged,
    this.onEditingComplete,
    this.onTap,
  }) : super(key: key);

  final String hint;
  final String label;
  final dynamic validator;

  final ValueChanged<String>? onchanged;
  final VoidCallback? onEditingComplete;
  final GestureTapCallback? onTap;

  @override
  State<NewTextField> createState() => _NewTextFieldState();
}

class _NewTextFieldState extends State<NewTextField> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.0267, vertical: screenHeight * 0.12),
      child: TextFormField(
        validator: widget.validator,
        onChanged: widget.onchanged,
        onEditingComplete: widget.onEditingComplete,
        onTap: widget.onTap,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hint,
          hintStyle: const TextStyle(),
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
