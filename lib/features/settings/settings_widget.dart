import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget(
      {Key? key, this.leadingTitle, this.trailingIcon, required this.action})
      : super(key: key);
  final String? leadingTitle;
  final Icon? trailingIcon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(),
      )),
      child: InkWell(
        onTap: action,
        child: ListTile(
          dense: true,
          leading: Text(
            leadingTitle!,
          ),
          trailing: trailingIcon,
        ),
      ),
    );
  }
}
