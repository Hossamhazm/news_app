import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/api_mangment.dart';
import 'package:news_app/model/ArticalResponses.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'artical_details_screen.dart';

class Search extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder<ArticalResponses>(
        future: ApiMangement.searchArticales(query),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.green,));
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(snapshot.error.toString())),
            );
          } else if (snapshot.hasData) {
            final articles = snapshot.data!.articles;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ArticlesDetailsScreen(),
                          settings: RouteSettings(
                              arguments: {
                                'imageUrl' : articles[index].urlToImage ?? "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg",
                                'sourceId': articles[index].source?.id ?? "",
                                'timeAgo': timeago.format(DateTime.parse(articles[index].publishedAt?? "") ) ,
                                'description': articles[index].description ?? "",
                                'title': articles[index].title ?? "",
                                'content': articles[index].content?? "",
                                'url' : articles[index].url ?? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.udacity.com%2Fblog%2F2021%2F03%2Fcreating-an-html-404-error-web-page.html&psig=AOvVaw0lV1LjLxB_CFiHRCW2NThy&ust=1696451709589000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIDhiZ7d2oEDFQAAAAAdAAAAABAJ",
                              }
                          )
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(articles[index].urlToImage ??
                            "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg"),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          child: Text(articles[index].source?.id ?? "",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          child: Text(articles[index].title ?? "",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          child: Text(timeago.format(DateTime.parse(articles[index].publishedAt?? "") ),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder<ArticalResponses>(
        future: ApiMangement.searchArticales(query),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.green,));
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(snapshot.error.toString())),
            );
          } else if (snapshot.hasData) {
            final articles = snapshot.data!.articles;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ArticlesDetailsScreen(),
                          settings: RouteSettings(
                              arguments: {
                                'imageUrl' : articles[index].urlToImage ?? "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg",
                                'sourceId': articles[index].source?.id ?? "",
                                'timeAgo': timeago.format(DateTime.parse(articles[index].publishedAt?? "") ) ,
                                'description': articles[index].description ?? "",
                                'title': articles[index].title ?? "",
                                'content': articles[index].content?? "",
                                'url' : articles[index].url ?? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.udacity.com%2Fblog%2F2021%2F03%2Fcreating-an-html-404-error-web-page.html&psig=AOvVaw0lV1LjLxB_CFiHRCW2NThy&ust=1696451709589000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIDhiZ7d2oEDFQAAAAAdAAAAABAJ",
                              }
                          )
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: articles[index].urlToImage ?? "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg",
                          placeholder: (context, url) => Image.network("https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg"),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          child: Text(articles[index].source?.id ?? "",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          child: Text(articles[index].title ?? "",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: double.infinity,
                          child: Text(timeago.format(DateTime.parse(articles[index].publishedAt?? "") ),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data available"));
          }
        });
  }

}