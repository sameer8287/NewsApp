// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/components/reusableCard.dart';
import 'package:news_app/models/bookmarkData_model.dart';

import '../../boxes/boxes.dart';
import '../detailPage.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => BbookMaekStarkScreen();
}

class BbookMaekStarkScreen extends State<BookMarkScreen> {
  Future<void> delete(BookmarkDataModel bookmarkDataModel) async {
    await bookmarkDataModel.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: ValueListenableBuilder<Box<BookmarkDataModel>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (BuildContext context, dynamic value, Widget? child) {
            var data = value.values.toList().cast<BookmarkDataModel>();
            return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                              newsUrl: data[index].url,
                              title: data[index].title,
                              desc: data[index].description,
                              content: data[index].content,
                              author: '',
                              url: data[index].Imageurl ??
                                  "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                        ));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13)),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(data[index]
                                                  .Imageurl ??
                                              "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
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
                                      data[index].title,
                                      overflow: TextOverflow.clip,
                                      maxLines: 3,
                                      // maxLines: 10,
                                      // softWrap: true,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data[index].description,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Source' + ' - ' + '',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      delete(data[index]);
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
