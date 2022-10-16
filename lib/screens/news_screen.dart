import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/news.dart';
import '../widgets/news_item.dart';

class NewsScreen extends StatefulWidget {
  final String url;
  final Key key;
  const NewsScreen({required this.key, required this.url}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<News> news = [];
  var isLoaded = false;
  var controller = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getData();
      }
    });
    //fetch data from API
    getData();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Future getData() async {
    const per_page = 8;
    var client = http.Client();
    List<News> Newnews;

    var uri = Uri.parse('${widget.url}per_page=$per_page&page=$page');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      Newnews = newsFromJson(json);
      setState(() {
        news.addAll(Newnews);
        page++;
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: const Color(0xff144CE4),
        onRefresh: getData,
        child: ListView.builder(
            controller: controller,
            itemCount: isLoaded ? news.length + 1 : 4,
            itemBuilder: (ctx, index) {
              if (isLoaded) {
                if (index < news.length) {
                  return NewsItem(
                    categoryId: news[index].categoryId,
                    title: news[index].title,
                    imageUrl: news[index].imageUrl,
                    date: news[index].date,
                    link: news[index].link,
                    content: news[index].content,
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: SpinKitCircle(
                        color: Color(0xff144CE4),
                        size: 45.0,
                      ),
                    ),
                  );
                }
              } else {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 7,
                    ),
                    height: 240,
                    width: double.infinity,
                  ),
                );
              }
            }),
      ),
    );
  }
}
