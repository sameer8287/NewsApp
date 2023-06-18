// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/components/categoryCard.dart';
import 'package:news_app/main.dart';
// import 'package:news_app/views/Category/bussiness.dart';
// import 'package:news_app/views/Category/entertainment.dart';
import 'package:news_app/views/Category/reusableCategoryPage.dart';
// import 'package:news_app/views/Category/health.dart';
// import 'package:news_app/views/Category/science.dart';
// import 'package:news_app/views/Category/sports.dart';
// import 'package:news_app/views/Category/technology.dart';

import '../../models/caurisolCardModel.dart';
import 'package:news_app/components/reusableCard.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  List<Widget> categoryList = [];

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
              itemBuilder: (context, index, realIndex) => CategoryCard(
                  data: CauroisalCardModel.lst[index],
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return reusableCategoryCard(
                          category:
                              CauroisalCardModel.lst[index].Data.toString(),
                        );
                      },
                    ));
                  }),
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
                  itemBuilder: (context, index) => reusableCard(
                    id: '0',
                    newsUrl: data.articles[index].url,
                      content: data.articles[index].content,
                      displayWidth: displayWidth,
                      displayHeight: displayHeight,
                      ImageUrl: data.articles[index].image,
                      title: data.articles[index].title,
                      dsc: data.articles[index].description,
                      source: data.articles[index].source.name),
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
