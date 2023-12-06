import 'package:flutter/material.dart';
import 'package:news_app/widgets/appBar_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    final Uri _url = Uri.parse(args['url']);
    return Scaffold(
      appBar: buildAppBar("News Title", context, true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(args['imageUrl'])),
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Text(args['sourceId'],
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
              child: Text(args['title'],
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
              child: Text(args['timeAgo'],
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              child: Text(args['content'],
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),
              ),
            ),
            const SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                _launchUrl(_url);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: Text(appLocalizations.textLink,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
}
}
