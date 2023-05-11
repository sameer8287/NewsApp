// ignore_for_file: no_logic_in_create_state, use_key_in_widget_constructors, unused_element

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../apiServices/dataProvider.dart';
import '../../apiServices/generalApiCall.dart';
import '../../components/reusableCard.dart';
import '../../main.dart';

// final generalNews = FutureProvider((ref) => GeneralApiCall());

class reusableCategoryCard extends ConsumerStatefulWidget {
  final String? category;

  reusableCategoryCard({super.key, this.category});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GeneralState();
}

class _GeneralState extends ConsumerState<reusableCategoryCard> {
  @override
  void initState() {
    // TODO: implement initState
    log(widget.category.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var displayHeight = MediaQuery.of(context).size.height;
    var displayWidth = MediaQuery.of(context).size.width;
    final GeneralNewsData =
        ref.watch(generalNewsData(widget.category.toString()));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: displayWidth,
              height: displayHeight * 0.06,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                      )),
                  Text(
                    widget.category.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: GeneralNewsData.when(
                data: (data) {
                  return ListView.builder(
                      itemCount: data.articles.length,
                      itemBuilder: (context, index) {
                        return reusableCard(
                            newsUrl: data.articles[index].url,
                            content: data.articles[index].content,
                            displayWidth: displayWidth,
                            displayHeight: displayHeight,
                            ImageUrl: data.articles[index].urlToImage,
                            title: data.articles[index].title,
                            dsc: data.articles[index].description,
                            source: data.articles[index].author);
                        // Card(
                        //   child: Padding(
                        //       padding: const EdgeInsets.only(left: 6, right: 6),
                        //       child: Container(
                        //         width: displayWidth,
                        //         height: displayHeight * 0.15,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(13)),
                        //         child: Row(
                        //           children: [
                        //             Column(
                        //               mainAxisAlignment:
                        //                   MainAxisAlignment.center,
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.center,
                        //               children: [
                        //                 Container(
                        //                   height: displayHeight * 0.1,
                        //                   width: displayWidth * 0.3,
                        //                   decoration: BoxDecoration(
                        //                       image: DecorationImage(
                        //                           image: NetworkImage(data
                        //                               .articles[index]
                        //                               .urlToImage),
                        //                           fit: BoxFit.cover),
                        //                       borderRadius:
                        //                           BorderRadius.circular(17)),
                        //                 )
                        //               ],
                        //             ),
                        //             Expanded(
                        //               child: Padding(
                        //                 padding: const EdgeInsets.all(8.0),
                        //                 child: Column(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.spaceEvenly,
                        //                   children: [
                        //                     Text(
                        //                       data.articles[index].title,
                        //                       overflow: TextOverflow.clip,
                        //                       maxLines: 3,
                        //                       // maxLines: 10,
                        //                       // softWrap: true,
                        //                       style: TextStyle(
                        //                           fontSize: 15,
                        //                           fontWeight: FontWeight.bold),
                        //                     ),
                        //                     Text(
                        //                       data.articles[index].description,
                        //                       overflow: TextOverflow.ellipsis,
                        //                     ),
                        //                     Align(
                        //                       alignment: Alignment.centerLeft,
                        //                       child: Text(
                        //                         'Source' +
                        //                             ' - ' +
                        //                             data.articles[index].source
                        //                                 .name,
                        //                         overflow: TextOverflow.ellipsis,
                        //                         style: TextStyle(fontSize: 12),
                        //                       ),
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //       )),
                        // );
                      });
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
