import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/loading_indicator.dart';

class NewsScreen extends StatelessWidget {
  static const routeName='news screen name route';


  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as NewsModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          news.title!,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 20,
            ),
            Text(
              news.content ?? '',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 13,
                color: AppTheme.darkBlueColor
              ),
            ),
            Row(
              children: [
                const Spacer(),
                TextButton(
                    onPressed: ()async{
                      bool launcherAvailable = await canLaunchUrl(Uri.parse(news.url!));
                      if(launcherAvailable && news.url != null){
                        launchUrl(
                            Uri.parse(news.url!),
                            mode: LaunchMode.inAppBrowserView
                        ).catchError((e){
                          print(e);
                        });
                      }

                    },
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                        child:  Text(
                            'View full article',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14
                          ),
                        ),

                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
