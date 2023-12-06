import 'package:flutter/material.dart';
import 'package:news_app/widgets/appBar_widget.dart';
import 'package:news_app/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controller/settings_provider.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> langList =["English","Arabic"];
  @override
  Widget build(BuildContext context) {
    SettingProvider settingsProvider = Provider.of(context,listen: true);
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar(appLocalizations.settings, context, true),
      body: Column(
        children: [
           Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              width: double.infinity,
              child: Text(appLocalizations.lang,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),
          DropdownMenu<String>(
            width: width * 0.7,
            initialSelection: settingsProvider.selectedLanguage,
            onSelected: (String? value) {
              settingsProvider.toggleLanguage(value!);
              print(settingsProvider.selectedLanguage);
              if (appLocalizations.lang == "Language") {
                langList = ["English", "Arabic"];
              } else if (appLocalizations.lang == "اللغة") {
                langList = ["اللغة الإنجليزية", "اللغة العربية"];
              }
              setState(() {});
            },
            textStyle: const TextStyle(
              color: Colors.green, // Set the side color to green
            ).copyWith(
              decorationColor: Colors.blue,
            ),
            dropdownMenuEntries: langList.map<DropdownMenuEntry<String>>((String value) {
              return DropdownMenuEntry<String>(
                value: value,
                label: value,
              );
            }).toList(),
          )
        ],
      ),
      drawer: buildDrawer(context),
    );
  }
}
