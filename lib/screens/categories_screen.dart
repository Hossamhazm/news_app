import 'package:flutter/material.dart';
import 'package:news_app/categories_dm.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/widgets/appBar_widget.dart';
import 'package:news_app/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: buildAppBar(appLocalizations.appTitle, context, true),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 50, right: 50, bottom: 20),
            child: Localizations.override(
              context: context,
              locale: const Locale('en'),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.7 / 0.85,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: categoryItems.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NewsScreen(),
                          settings: RouteSettings(
                            arguments: {
                              'id': categoryItems[index].id,
                              'categoryName': categoryItems[index].getLocalizedCategoryName(context),
                            },
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: categoryItems[index].color,
                        borderRadius: categoryItems[index].side == "right"
                            ? const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        )
                            : const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(categoryItems[index].imagePath),
                          Text(
                            categoryItems[index].getLocalizedCategoryName(context),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 35,
            left:appLocalizations.lang == "Language"? 35: 0,
            right: appLocalizations.lang == "Language"? 0: 35,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                appLocalizations.categoryHeaderTxt,
                style: const TextStyle(
                  color: Colors.black38,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: buildDrawer(context),
    );
  }
}


