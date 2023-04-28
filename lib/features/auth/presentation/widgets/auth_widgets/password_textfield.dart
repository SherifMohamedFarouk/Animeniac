import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield(
      {Key? key,
      required this.label,
      required this.hint,
      required this.validator,
      this.onchanged,
      this.onEditingComplete,
      this.onTap})
      : super(key: key);
  final String label;
  final String hint;
  final validator;

  final ValueChanged<String>? onchanged;
  final VoidCallback? onEditingComplete;
  final GestureTapCallback? onTap;

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _showPassword = true;
  void _toggle() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

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
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: widget.label,
            hintText: widget.hint,
            hintStyle: TextStyle(),
            suffixIcon: IconButton(
              icon: _showPassword
                  ? Icon(FeatherIcons.eyeOff)
                  : Icon(FeatherIcons.eye),
              onPressed: _toggle,
            )),
        obscureText: _showPassword,
      ),
    );
  }
}
