import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class LoadingsWidgets {
  static Shimmer appBarTitleLoad = Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.white,
    child: Text(
      S.current.title,
      style: const TextStyle(
        fontSize: 24,
      ),
    ),
  );

  static Shimmer sliderLoader = Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.white,
    child: CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) => Container(
        width: 320,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      itemCount: 10,
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayCurve: Curves.decelerate,
        enlargeCenterPage: true,
      ),
    ),
  );

  static Shimmer allNewsItemLoader = Shimmer.fromColors(
    baseColor: Colors.grey,
    highlightColor: Colors.white,
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: 240,
              height: 16,
              color: Colors.grey,
            ),
            Container(
              height: 16,
              width: 320,
              color: Colors.grey,
            ),
            Container(
              height: 16,
              color: Colors.grey,
            ),
            Container(
              width: 160,
              height: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    ),
  );
}
