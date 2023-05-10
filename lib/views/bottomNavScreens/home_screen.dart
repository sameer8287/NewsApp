// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/categoryCard.dart';
import 'package:news_app/main.dart';

import '../../models/caurisolCardModel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headLinadata = ref.watch(headlineData);
    var displayHeight = MediaQuery.of(context).size.height;
    var displayWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: displayHeight * 0.01),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: displayHeight * 0.06,
              width: displayWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Category',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: displayHeight * 0.02),
          CarouselSlider.builder(
              itemCount: CauroisalCardModel.lst.length,
              itemBuilder: (context, index, realIndex) =>
                  CategoryCard(data: CauroisalCardModel.lst[index]),
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true)),
          SizedBox(height: displayHeight * 0.02),
          Container(
            height: displayHeight * 0.06,
            width: displayWidth,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top HeadLine',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: displayHeight * 0.02),
          Expanded(
            child: headLinadata.when(
              data: (data) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Container(
                        width: displayWidth,
                        height: displayHeight * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13)),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: displayHeight * 0.1,
                                  width: displayWidth * 0.3,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              data.articles[index].image),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(17)),
                                )
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      data.articles[index].title,
                                      overflow: TextOverflow.clip,
                                      maxLines: 3,
                                      // maxLines: 10,
                                      // softWrap: true,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data.articles[index].description,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Source' +
                                            ' - ' +
                                            data.articles[index].source.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CircularProgressIndicator(),
              )),
            ),
          )
        ],
      ),
    );
  }
}
