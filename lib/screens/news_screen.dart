import 'package:flutter/material.dart';
import 'package:news_app/widgets/appBar_widget.dart';
import 'package:news_app/widgets/article_taps_widget.dart';
import 'package:news_app/widgets/drawer_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: buildAppBar(args['categoryName'],context,false),
      body: ArticlesTaps(category: args['id']),
      drawer: buildDrawer(context),
    );
  }
}
