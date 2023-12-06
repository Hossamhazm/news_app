import 'package:flutter/material.dart';
import 'package:news_app/model/StatusResponses.dart';

import '../data/api_mangment.dart';
import 'article_widget.dart';

class ArticlesTaps extends StatefulWidget {
  String category;
  ArticlesTaps({Key? key, required this.category}) : super(key: key);

  @override
  State<ArticlesTaps> createState() => _ArticlesTapsState();
}

class _ArticlesTapsState extends State<ArticlesTaps> {
  late Future<SourcesResponses> futureSourcesResponses;
  late List<Widget> tabViews;
  int selectedTabIndex = 0;

  @override
  void initState() {
    futureSourcesResponses = ApiMangement.getSources(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponses>(
      future: futureSourcesResponses,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final sources = snapshot.data!.sources!;
          tabViews = sources.map((source) => ArticleView(source: source)).toList();
          return DefaultTabController(
            length: sources.length,
            initialIndex: selectedTabIndex,
            child: Column(
              children: [
                Container(
                  height: 40,
                  margin: const EdgeInsets.all(20),
                  child: TabBar(
                    enableFeedback: false,
                    dividerColor: Colors.white,
                    indicatorColor: Colors.white,
                    onTap: (index) {
                      setState(() {
                        selectedTabIndex = index;
                      });
                    },
                    isScrollable: true,
                    tabs: sources.map((source) {
                      return Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.green,width: 1.2),
                          color: selectedTabIndex == sources.indexOf(source)
                              ? Colors.green
                              : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            source.id!,
                              overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: selectedTabIndex == sources.indexOf(source)
                                  ? Colors.white
                                  : Colors.green,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: tabViews,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Container(
            height: 40,
            margin: const EdgeInsets.all(20),
            child: const Center(child: CircularProgressIndicator(color: Colors.green,)),
          );
        }
      },
    );
  }
}