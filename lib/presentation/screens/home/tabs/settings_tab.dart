import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/theme/app_styles.dart';
import 'package:todo_app/core/utils/colors_manger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../providers/language_provider.dart';
import '../../../../providers/theme_provider.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  String selectedLanguage = 'English';
  String selectedMode = 'Light';

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    LanguageProvider languageProvider = Provider.of(context);
    String selectedLanguage =
    languageProvider.isEnglish() ? 'English' : 'العربية';
    String selectedMode = themeProvider.isLightMode()
        ? AppLocalizations.of(context)!.light
        : AppLocalizations.of(context)!.dark;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
          AppLocalizations.of(context)!.language,
            style:themeProvider.isLightMode()
                ? LightAppStyle.settingsTabLabel
                : DarkAppStyle.settingsTabLabel,
          ),
          const SizedBox(
            height: 10,
          ),
          buildSettingsTabComponent(
              item: MenuItem(item1: 'English', item2: 'العربية'),
              selectedItem: selectedLanguage,
              onSelected: (newLang) {
                languageProvider.changeAppLang(newLang!);
                setState(() {
                  selectedLanguage = newLang ?? selectedLanguage;
                });
              }),
          const SizedBox(
            height: 16,
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: themeProvider.isLightMode()
                ? LightAppStyle.settingsTabLabel
                : DarkAppStyle.settingsTabLabel,
          ),
          const SizedBox(
            height: 10,
          ),
          buildSettingsTabComponent(
              item: MenuItem(
                  item1: AppLocalizations.of(context)!.light,
                  item2: AppLocalizations.of(context)!.dark),
              selectedItem: selectedMode,
              onSelected: (newMode) {
                themeProvider.changeThemeMode(context, newMode!);
                setState(() {
                  selectedMode = newMode ?? selectedMode;
                });
              }),
        ],
      ),
    );
  }

  Widget buildSettingsTabComponent(
          {required MenuItem item,
          required String selectedItem,
          required Function(String?) onSelected}) {
    ThemeProvider themeProvider = Provider.of(context);

    return Container(
      padding: REdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme
            .of(context)
            .colorScheme
            .onPrimary,
        border: Border.all(
          color: ColorsManger.blue,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedItem,
            style: themeProvider.isLightMode()
                ? LightAppStyle.settingsTabSelectedItem
                : DarkAppStyle.settingsTabSelectedItem,
          ),
          buildDropDown(
              item: item, selectedItem: selectedItem, onSelected: onSelected),
        ],
      ),
    );
  }
  Widget buildDropDown(
          {required MenuItem item,
          required String selectedItem,
          required Function(String?) onSelected})
  =>
      DropdownButton<String>(
        underline: const SizedBox(),
        iconSize: 28,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: ColorsManger.blue,
        ),
        isDense: true,
        items: <String>[item.item1, item.item2].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onSelected,
      );
}

class MenuItem {
  String item1;
  String item2;

  MenuItem({required this.item1, required this.item2});
}
