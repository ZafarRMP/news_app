import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/provider/news_provider/news_provider.dart';
import 'package:news_app/ui/components/loadings_widgets/loadings_widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePageAllNews extends StatelessWidget {
  const HomePageAllNews({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewsProvider>(context);
    final data = model.data;
    return data?.items.length != null
        ? ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => AllNewsItem(
              index: index,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: data!.items.length,
          )
        : ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) => LoadingsWidgets.allNewsItemLoader,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: 10,
          );
  }
}

class AllNewsItem extends StatelessWidget {
  final int index;
  const AllNewsItem({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewsProvider>(context);
    final data = model.data;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        await launchUrlString(data.items[index].link!);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: data?.items[index].enclosure?.url != null
                  ? CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      height: 200,
                      width: double.infinity,
                      imageUrl: data!.items[index].enclosure!.url!,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    )
                  : const SizedBox(
                      height: 250,
                      child: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    ),
            ),
            const SizedBox(height: 12),
            Text(
              data!.items[index].title!,
              style: const TextStyle(
                fontSize: 16,
                height: 1.1,
                wordSpacing: 3,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              data.items[index].pubDate!,
            ),
          ],
        ),
      ),
    );
  }
}
