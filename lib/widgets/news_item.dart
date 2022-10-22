import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../screens/news_details_screen.dart';

class NewsItem extends StatelessWidget {
  final int categoryId;
  final String title;
  final String imageUrl;
  final String date;
  final String link;
  final String content;
  // final String views;

  const NewsItem({
    required this.categoryId,
    required this.title,
    required this.imageUrl,
    required this.date,
    required this.link,
    required this.content,
    // required this.views,
  });

  String get categoryText {
    switch (categoryId) {
      case 47:
        return 'أخبار';
        break;
      case 48:
        return 'سياسة';
        break;
      case 49:
        return 'رياضة';
        break;
      case 50:
        return 'فن';
        break;
      case 51:
        return 'صحة';
        break;
      case 52:
        return 'مجتمع';
        break;
      case 53:
        return 'تقنية';
        break;
      case 54:
        return 'مال وأعمال';
        break;
      default:
        return 'غير معرف';
    }
  }

  String get timeagoText {
    return timeago.format(DateTime.parse(date), locale: 'ar');
  }

  String get titleText {
    return HtmlUnescape().convert(title);
  }

  String get ImageUrl {
    return "https://imoumedia24.com" + imageUrl;
  }

  Color get color {
    switch (categoryId) {
      case 47:
        return const Color(0xff144CE4).withOpacity(0.5); // أخبار
        break;
      case 48:
        return const Color(0xff8B4513).withOpacity(0.5);
        break;
      case 49:
        return Colors.yellow.withOpacity(0.7);
        break;
      case 50:
        return Colors.green.withOpacity(0.5);
        break;
      case 51:
        return Colors.purple.withOpacity(0.5);
        break;
      case 52:
        return Colors.redAccent.withOpacity(0.5);
        break;
      case 53:
        return Colors.orange.withOpacity(0.5);
        break;
      case 54:
        return Colors.teal.withOpacity(0.5);
        break;
      default:
        return Colors.grey.withOpacity(0.5);
    }
  }

  void selectNewsItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      NewsDetailsScreen.screenRoute,
      arguments: {
        // 'id': id,
        // 'categoryText': categoryText,
        // 'category': category,
        'title': titleText,
        'imageUrl': ImageUrl,
        // 'timeagoText': timeagoText,
        'link': link,
        'content': content,
        // 'views': views,
        // 'num_comments': num_comments,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectNewsItem(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 7,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: /* CachedNetworkImage(
                imageUrl: imageUrl,
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  child: Image.asset(
                    '/assets/images/icon-blackwhite.png',
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  '/assets/images/icon.png',
                ),
              ), */
                  Image.network(
                ImageUrl,
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Image.asset(
                    'assets/images/icon-blackwhite.png',
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'assets/images/icon.png',
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Container(
              height: 240,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.8),
                  ],
                  stops: const [0.6, 1],
                ),
              ),
              child: Text(
                titleText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Tajawal',
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      categoryText,
                      // category,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      timeagoText,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'Cairo',
                      ),
                    ),
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
