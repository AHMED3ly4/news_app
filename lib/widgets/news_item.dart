import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
class NewsItem extends StatelessWidget {
  final NewsModel news;
  const NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    final String duration = timeago.format(DateTime.parse(news.publishedAt ?? DateTime.now().toString()) );
    return InkWell(
      onTap: (){

        Navigator.pushNamed(
          context,
            NewsScreen.routeName,
          arguments: news,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                imageUrl: news.urlToImage ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/495px-No-Image-Placeholder.svg.png?20200912122019',
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) =>  LoadingIndicator(),
              height: MediaQuery.of(context).size.height *0.25,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              news.source!.name ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              news.title ?? '',
              style: const TextStyle(
                fontSize: 14
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text(
                duration,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
