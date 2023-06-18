import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/apiServices/worldApi.dart';

import '../../apiServices/dataProvider.dart';
import '../../components/reusableCard.dart';

class WordWidePage extends ConsumerStatefulWidget {
  const WordWidePage({super.key});

  @override
  ConsumerState<WordWidePage> createState() => _WordWidePageState();
}

class _WordWidePageState extends ConsumerState<WordWidePage> {
  @override
  Widget build(BuildContext context) {
    var displayHeight = MediaQuery.of(context).size.height;
    var displayWidth = MediaQuery.of(context).size.width;
    final worldNews = ref.watch(worlfNewData);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: worldNews.when(
              data: (data) {
                return ListView.builder(
                    itemCount: data.articles.length,
                    itemBuilder: (context, index) {
                      return reusableCard(
                          id: '0',
                          newsUrl: data.articles[index].url,
                          content: data.articles[index].content,
                          displayWidth: displayWidth,
                          displayHeight: displayHeight,
                          ImageUrl: data.articles[index].urlToImage,
                          title: data.articles[index].title,
                          dsc: data.articles[index].description,
                          source: data.articles[index].author);
                    });
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
