import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/cubit/theme_cubit.dart';
import '../../core/global_widgets/settings_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              ListTile(
                leading: Icon(
                  state.isDarkThemeOn
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode,
                  // color: theme.textColor,
                ),
                title: Text(state.isDarkThemeOn ? "Light Mode" : "Dark Mode"),
                trailing: Switch(
                  value: state.isDarkThemeOn,
                  activeColor: theme.primaryColor,
                  inactiveTrackColor: Colors.grey,
                  onChanged: (newValue) {
                    context.read<ThemeCubit>().updateTheme(newValue);
                  },
                ),
              ),
              // SettingsWidget(
              //   action: () {},
              //   leadingTitle: 'Terms of Use',
              //   trailingIcon: Icon(
              //     Icons.arrow_forward_ios_rounded,
              //     size: 10,
              //   ),
              // ),
              // SettingsWidget(
              //   action: () {},
              //   leadingTitle: 'Privacy Policy',
              //   trailingIcon: Icon(
              //     Icons.arrow_forward_ios_rounded,
              //     size: 10,
              //   ),
              // ),
              SettingsWidget(
                action: () {
                  // Logout.logout(context);
                },
                leadingTitle: 'Logout',
                trailingIcon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 10,
                ),
              ),
            ],
          ),
          bottomSheet: const Text(
            'Made by Ehab_Nasser',
          ),
        );
      },
    );
  }
}
