import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news_app/domain/provider/news_provider/news_provider.dart';
import 'package:news_app/ui/components/loadings_widgets/loadings_widgets.dart';
import 'package:provider/provider.dart';

class HomePageSlider extends StatelessWidget {
  const HomePageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NewsProvider>(context);
    final data = model.data;
    return model.data?.items == null
        ? LoadingsWidgets.sliderLoader
        : CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) => SliderItem(
              bgPath: data?.items[index].enclosure?.url,
              itemTitle: data?.items[index].title,
            ),
            itemCount: data?.items.length,
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 8),
              autoPlayCurve: Curves.decelerate,
              enlargeCenterPage: true,
            ),
          );
  }
}

class SliderItem extends StatelessWidget {
  final String? bgPath;
  final String? itemTitle;
  const SliderItem({
    super.key,
    this.bgPath,
    this.itemTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 320,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: bgPath!,
              progressIndicatorBuilder: (context, url, progress) =>
                  const Center(
                child: CupertinoActivityIndicator(),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported_sharp),
            ),
          ),
        ),
        Container(
          height: 320,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          alignment: Alignment.bottomLeft,
          child: Text(
            itemTitle!,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
