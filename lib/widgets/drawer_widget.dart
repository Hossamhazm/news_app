import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../screens/categories_screen.dart';
import '../screens/settings_screen.dart';

Drawer buildDrawer(BuildContext context){
  AppLocalizations appLocalizations = AppLocalizations.of(context)!;
  return Drawer(
      child : Column(
        children: [
          Container(
              height: 150,
              width: double.infinity,
              color: Colors.green,
              child: Center(child: Text("${appLocalizations.appTitle}!",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ))),
          const SizedBox(height: 25,),
          builtDrawerChoice(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CategoriesScreen(),)), Icons.list, appLocalizations.categories),
          const SizedBox(height: 18,),
          builtDrawerChoice(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SettingsScreen(),)), Icons.settings, appLocalizations.settings)
        ],
      )
  );
}
Widget builtDrawerChoice(Function() function,IconData icon,String text){
  return InkWell(
    onTap: function,
    child: Row(
      children: [
        const SizedBox(width: 10,),
        Icon(
          icon,
          size: 40,
          color: Colors.black,
        ),
        const SizedBox(width: 15,),
        Text(
          text,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    ),
  );
}