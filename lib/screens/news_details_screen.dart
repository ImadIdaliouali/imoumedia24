import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatefulWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);
  static const screenRoute = '/news-details-screen';
  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final title = routeArgument['title'];
    final imageUrl = routeArgument['imageUrl'];
    final link = routeArgument['link'];
    final content = routeArgument['content'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff144CE4),
        actions: [
          IconButton(
            onPressed: () async {
              var url = "https://api.whatsapp.com/send?text=$title\n$link";
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            icon: const Icon(Icons.whatsapp),
          ),
          IconButton(
            onPressed: () async {
              var url =
                  "https://www.facebook.com/sharer/sharer.php?u=$link"; // &t=$title
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
            icon: const Icon(Icons.facebook),
          ),
          IconButton(
            onPressed: () {
              Share.share('$title\n$link');
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              imageUrl,
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset(
                  'assets/images/icon.png',
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            Container(
              margin: const EdgeInsets.all(7),
              padding: const EdgeInsets.all(7),
              child: Column(
                children: [
                  SelectableText(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Html(
                    data: content,
                    onImageError: (exception, stackTrace) {
                      Container();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
