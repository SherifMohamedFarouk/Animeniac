import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/color/colors.dart';
import '../../core/navigation/custom_navigation.dart';
import '../../core/navigation/routes.dart';
import 'settings_imports.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? userName;
  @override
  void initState() {
    super.initState();
    showDisplayName();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: TopBar(
            title: 'assets/images/anime3.png',
            page: "settings".tr(context),
          ),
          body: Column(
            children: [
              ListTile(
                leading: Icon(
                  state.isDarkThemeOn
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode,
                  // color: theme.textColor,
                ),
                title: Text(state.isDarkThemeOn
                    ? "light_theme".tr(context)
                    : "dark_theme".tr(context)),
                trailing: Switch(
                  value: state.isDarkThemeOn,
                  activeColor: theme.primaryColor,
                  inactiveTrackColor: Colors.grey,
                  onChanged: (newValue) {
                    context.read<ThemeCubit>().updateTheme(newValue);
                  },
                ),
              ),
              BlocConsumer<LocaleCubit, ChangeLocaleState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ListTile(
                    leading: Text('change_lang'.tr(context)),
                    trailing: DropdownButton<String>(
                      value: state.locale.languageCode,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: ['ar', 'en'].map((String items) {
                        return DropdownMenuItem<String>(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          context.read<LocaleCubit>().changeLanguage(newValue);
                        }
                      },
                    ),
                  );
                },
              ),
              FirebaseAuth.instance.currentUser != null
                  ? SettingsWidget(
                      action: () {},
                      leadingTitle: '${'current_user'.tr(context)} : $userName',
                      trailingIcon: const Icon(Icons.person))
                  : const SizedBox.shrink(),
              FirebaseAuth.instance.currentUser != null
                  ? SettingsWidget(
                      action: () {
                        auth.signOut();
                        CustomNavigator.push(Routes.main, clean: true);
                      },
                      leadingTitle: 'log_out'.tr(context),
                      trailingIcon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: errorColor,
                      ),
                    )
                  : SettingsWidget(
                      action: () {
                        CustomNavigator.push(Routes.signIn, clean: true);
                      },
                      leadingTitle: 'log_in'.tr(context),
                      trailingIcon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: successColor,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  void showDisplayName() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var collection = FirebaseFirestore.instance.collection('users');

      var docSnapshot = await collection.doc(auth.currentUser!.uid).get();

      Map<String, dynamic> data = docSnapshot.data()!;
      setState(() {
        userName = data['name'];
      });
    }
  }
}
