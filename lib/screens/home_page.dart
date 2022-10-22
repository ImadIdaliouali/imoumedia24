import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';
import 'package:imoumedia24/screens/callUs_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import './news_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget appBarTitle = Image.asset(
    'assets/images/icon.png',
    height: 56,
    width: 90,
    fit: BoxFit.cover,
  );
  Icon actionIcon = const Icon(Icons.search);
  var currentPage = DrawerSections.main;

  @override
  Widget build(BuildContext context) {
    var body;
    if (currentPage == DrawerSections.main) {
      body = NewsScreen(
        key: UniqueKey(),
        url: 'https://imoumedia24.com/wp-json/wp/v2/posts?_embed&',
      );
    } else if (currentPage == DrawerSections.callUs) {
      body = const CallUsScreen();
    } else if (currentPage == DrawerSections.news) {
      body = NewsScreen(
        key: UniqueKey(),
        url:
            'https://imoumedia24.com/wp-json/wp/v2/posts?_embed&categories=47&',
      );
    } else if (currentPage == DrawerSections.policy) {
      body = NewsScreen(
        key: UniqueKey(),
        url:
            'https://imoumedia24.com/wp-json/wp/v2/posts?_embed&categories=48&',
      );
    } else if (currentPage == DrawerSections.sports) {
      body = NewsScreen(
        key: UniqueKey(),
        url:
            'https://imoumedia24.com/wp-json/wp/v2/posts?_embed&categories=49&',
      );
    } else if (currentPage == DrawerSections.art) {
      body = NewsScreen(
        key: UniqueKey(),
        url:
            'https://imoumedia24.com/wp-json/wp/v2/posts?_embed&categories=50&',
      );
    } else if (currentPage == DrawerSections.health) {
      body = NewsScreen(
        key: UniqueKey(),
        url:
            'https://imoumedia24.com/wp-json/wp/v2/posts?_embed&categories=51&',
      );
    } else if (currentPage == DrawerSections.community) {
      body = NewsScreen(
        key: UniqueKey(),
        url:
            'https://imoumedia24.com/wp-json/wp/v2/posts?_embed&categories=52&',
      );
    } else if (currentPage == DrawerSections.technique) {
      body = NewsScreen(
        key: UniqueKey(),
        url:
            'https://imoumedia24.com/wp-json/wp/v2/posts?_embed&categories=53&',
      );
    } else if (currentPage == DrawerSections.business) {
      body = NewsScreen(
        key: UniqueKey(),
        url:
            'https://imoumedia24.com/wp-json/wp/v2/posts?_embed&categories=54&',
      );
    }
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: appBarTitle,
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xff144CE4),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: actionIcon,
          ),
          /* IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ), */
        ],
      ),
      body: body,
    );
  }

  Widget AppDrawer() {
    return Drawer(
      backgroundColor: const Color(0xff144CE4),
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                height: 56,
                color: const Color(0xff144CE4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        var email = "imou.media@gmail.com";
                        var emailurl = "mailto:$email";
                        await launch(emailurl);
                      },
                      icon: const Icon(
                        FontAwesome.at,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        var url =
                            "https://www.youtube.com/channel/UC09zeOtcduuwS2MRppTJksQ";
                        await launch(url);
                      },
                      icon: const Icon(
                        FontAwesome.youtube_play,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        var url = "https://imoumedia24.com/";
                        await launch(url);
                      },
                      icon: const Icon(
                        FontAwesome.firefox,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        var url = "https://www.facebook.com/imoumedia24";
                        await launch(url);
                      },
                      icon: const Icon(
                        FontAwesome.facebook_squared,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              DrawerListTile(
                1,
                'الرئيسية',
                FontAwesome.home,
                currentPage == DrawerSections.main,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade400,
              ),
              DrawerListTile(
                2,
                'اتصل بنا',
                Icons.email,
                currentPage == DrawerSections.callUs,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade400,
              ),
              DrawerListTile(
                3,
                'أخبار',
                FontAwesome.newspaper,
                currentPage == DrawerSections.news,
              ),
              DrawerListTile(
                4,
                'سياسة',
                FontAwesome.bank,
                currentPage == DrawerSections.policy,
              ),
              DrawerListTile(
                5,
                'رياضة',
                FontAwesome.soccer_ball,
                currentPage == DrawerSections.sports,
              ),
              DrawerListTile(
                6,
                'فن',
                Maki.art_gallery,
                currentPage == DrawerSections.art,
              ),
              DrawerListTile(
                7,
                'صحة',
                FontAwesome.user_md,
                currentPage == DrawerSections.health,
              ),
              DrawerListTile(
                8,
                'مجتمع',
                FontAwesome.users,
                currentPage == DrawerSections.community,
              ),
              DrawerListTile(
                9,
                'تقنية',
                FontAwesome.internet_explorer,
                currentPage == DrawerSections.technique,
              ),
              DrawerListTile(
                10,
                'مال وأعمال',
                ModernPictograms.money,
                currentPage == DrawerSections.business,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget DrawerListTile(int id, String title, IconData leading, bool selected) {
    return Material(
      color: selected
          ? const Color(0xff144CE4).withOpacity(0.1)
          : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.main;
            } else if (id == 2) {
              currentPage = DrawerSections.callUs;
            } else if (id == 3) {
              currentPage = DrawerSections.news;
            } else if (id == 4) {
              currentPage = DrawerSections.policy;
            } else if (id == 5) {
              currentPage = DrawerSections.sports;
            } else if (id == 6) {
              currentPage = DrawerSections.art;
            } else if (id == 7) {
              currentPage = DrawerSections.health;
            } else if (id == 8) {
              currentPage = DrawerSections.community;
            } else if (id == 9) {
              currentPage = DrawerSections.technique;
            } else if (id == 10) {
              currentPage = DrawerSections.business;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  leading,
                  size: 20,
                  color: selected ? const Color(0xff144CE4) : Colors.black,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  title,
                  style: TextStyle(
                    color: selected ? const Color(0xff144CE4) : Colors.black,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  main,
  callUs,
  news,
  policy,
  sports,
  art,
  health,
  community,
  technique,
  business,
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xff144CE4),
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(color: Colors.white),
      ),
      hintColor: Colors.white,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return NewsScreen(
      key: UniqueKey(),
      url: 'https://imoumedia24.com/wp-json/wp/v2/posts?_embed&search=$query&',
    );
  }

  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
