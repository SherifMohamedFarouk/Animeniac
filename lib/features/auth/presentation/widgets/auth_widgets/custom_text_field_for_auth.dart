import 'package:flutter/material.dart';

import '../../../../../core/color/colors.dart';

class CustomTextFieldForAuth extends StatefulWidget {
  const CustomTextFieldForAuth({
    Key? key,
    this.textEditingController,
    this.obscureText,
    this.keyboardType,
    this.hintText,
    this.suffixIcon,
    this.onClickSuffixIcon,
    this.onEditingComplete,
    this.prefixColor,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.autoValidateMode,
    this.onSaved,
    this.scrollController,
    this.validate = false,
    this.errorText,
    this.isFieldDone = false,
    this.maxLines = 1,
    this.style,
    this.contentPadding,
    this.prefix,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.textAlign,
    this.labelText,
    this.outerBorder,
    this.textStyle,
  }) : super(key: key);
  final TextEditingController? textEditingController;
  final bool? obscureText, validate, isFieldDone;
  final TextInputType? keyboardType;
  final String? hintText, errorText, labelText;
  final Widget? suffixIcon;
  final Function? onClickSuffixIcon;
  final VoidCallback? onEditingComplete;
  final Color? prefixColor;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final AutovalidateMode? autoValidateMode;
  final FormFieldSetter<String>? onSaved;
  final ScrollController? scrollController;
  final int? maxLines;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefix;
  final BoxConstraints? suffixIconConstraints;
  final bool? readOnly;
  final TextAlign? textAlign;
  final BoxBorder? outerBorder;
  final TextStyle? textStyle;

  @override
  _CustomTextFieldForAuthState createState() => _CustomTextFieldForAuthState();
}

class _CustomTextFieldForAuthState extends State<CustomTextFieldForAuth> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      textAlign: widget.textAlign ?? TextAlign.left,
      controller: widget.textEditingController,
      obscureText: widget.obscureText!,
      keyboardType: widget.keyboardType,
      cursorHeight: 22,
      readOnly: widget.readOnly!,
      onEditingComplete: widget.onEditingComplete,
      style: widget.textStyle,
      scrollController: widget.scrollController,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor.withOpacity(0.5))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: !widget.validate! ? primaryColor : Color(0xffEB001B))),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor.withOpacity(0.5))),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: !widget.validate! ? primaryColor : Color(0xffEB001B))),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: !widget.validate! ? primaryColor : Color(0xffEB001B))),
        filled: true,
        fillColor: Colors.transparent,
        suffixIconConstraints:
            widget.suffixIconConstraints ?? const BoxConstraints(maxWidth: 45),
        isCollapsed: true,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.only(
              top: 15,
              bottom: 5,
            ),
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 3.5,
              color: !widget.validate! ? secondaryColor : Color(0xffEB001B),
            ),
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: !widget.validate! ? primaryColor : Color(0xffEB001B),
            ),
        labelText: widget.labelText,
        errorText: widget.errorText != "" ? widget.errorText : null,
        errorStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(height: 1, color: Color(0xffEB001B)),
        prefix:
            widget.prefix ?? const Padding(padding: EdgeInsets.only(left: 0.0)),
      ),
    );
  }
}
