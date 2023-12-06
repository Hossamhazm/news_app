import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Categories {
  String id;
  String imagePath;
  String categoryName;
  Color color;
  String side;

  Categories({
    required this.id,
    required this.imagePath,
    required this.categoryName,
    required this.color,
    required this.side,
  });

  String getLocalizedCategoryName(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    if (categoryName == "Sports") {
      return appLocalizations.sports;
    } else if (categoryName == "Politics") {
      return appLocalizations.politics;
    } else if (categoryName == "Health") {
      return appLocalizations.health;
    } else if (categoryName == "Business") {
      return appLocalizations.business;
    } else if (categoryName == "Environment") {
      return appLocalizations.environment;
    } else if (categoryName == "Science") {
      return appLocalizations.science;
    } else {
      return categoryName;
    }
  }
}

List<Categories> categoryItems = [
  Categories(
    id: "sports",
    imagePath: "assets/sports.png",
    categoryName: "Sports",
    color: const Color(0xfffc91c22),
    side: "right",
  ),
  Categories(
    id: "politics",
    imagePath: "assets/Politics.png",
    categoryName: "Politics",
    color: const Color(0xfff003e90),
    side: "left",
  ),
  Categories(
    id: "health",
    imagePath: "assets/health.png",
    categoryName: "Health",
    color: const Color(0xfffed1e79),
    side: "right",
  ),
  Categories(
    id: "business",
    imagePath: "assets/bussines.png",
    categoryName: "Business",
    color: const Color(0xfffcf7e48),
    side: "left",
  ),
  Categories(
    id: "environment",
    imagePath: "assets/environment.png",
    categoryName: "Environment",
    color: const Color(0xfff4882cf),
    side: "right",
  ),
  Categories(
    id: "science",
    imagePath: "assets/science.png",
    categoryName: "Science",
    color: const Color(0xffff4d352),
    side: "left",
  ),
];
