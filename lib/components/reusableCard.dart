import 'package:flutter/material.dart';
import 'package:news_app/models/bookmarkData_model.dart';
import 'package:news_app/views/detailPage.dart';

class reusableCard extends StatelessWidget {
  final String? ImageUrl;
  final String title;
  final String dsc;
  final String source;
  final String content;
  final String newsUrl;
  final String id;

  const reusableCard(
      {super.key,
      required this.displayWidth,
      required this.displayHeight,
      required this.ImageUrl,
      required this.title,
      required this.dsc,
      required this.source,
      required this.content,
      required this.newsUrl,
      required this.id});

  final double displayWidth;
  final double displayHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                  newsUrl: newsUrl,
                  title: title,
                  desc: dsc,
                  content: content,
                  author: source,
                  url: ImageUrl ??
                      "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
            ));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: Container(
            width: displayWidth,
            height: displayHeight * 0.15,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
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
                              image: NetworkImage(ImageUrl ??
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                          // maxLines: 10,
                          // softWrap: true,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          dsc,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Source' + ' - ' + source,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: id == '0' ? false : true,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            // delete(data[index]);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
