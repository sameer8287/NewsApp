// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String desc;
  final String content;
  final String author;
  final String? url;
  final String ? newsUrl;
  DetailPage(
      {super.key,
      required this.title,
      required this.desc,
      required this.content,
      required this.author,
      required this.url,
      required this.newsUrl});

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
   
  //  final String  ul =Uri.parse(
  //   'https://stackoverflow.com/questions/47147973/networkimage-cannot-be-assigned-to-type-widget'
  //   ).toString(); 

  _launcherurl() async{
    const url = "https://stackoverflow.com/questions/47147973/networkimage-cannot-be-assigned-to-type-widget";
    if(await canLaunchUrl(Uri.http(url)))
    {
      await launchUrl(Uri.http(url));
    }
    else
    {
      throw "Cloud not";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              title: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close, color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child:
                            const Icon(Icons.abc_outlined, color: Colors.black),
                      ),
                    ],
                  )),
              pinned: true,
              snap: false,
              floating: false,
              backgroundColor: Colors.transparent,
              expandedHeight: MediaQuery.of(context).size.height,
              flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.39,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey.shade300,
                              child: Image.network(
                                url ??
                                    "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                                fit: BoxFit.cover,
                              )),
                        ],
                      )),
                  Positioned(
                    bottom: 60,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.645,
                        color: Colors.white,
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Text(
                                  title.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(
                                            desc.toString(),
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          Text(
                                            content.toString(),
                                            style: TextStyle(fontSize: 19),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child:
                                                    Text('Source - $author')),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                // InkWell(
                                //   child: Container(
                                //     height:
                                //         MediaQuery.of(context).size.height * 0.05,
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(15),
                                //         color: Colors.black),
                                //     child: Center(
                                //         child: Text(
                                //       'Read More',
                                //       style: TextStyle(
                                //           fontSize: 20, color: Colors.white),
                                //     )),
                                //   ),
                                // )
                              ],
                            )
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       "jfhewg",
                            //       style: TextStyle(
                            //           fontSize: 40,
                            //           color: Colors.black,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     const SizedBox(
                            //       height: 10,
                            //     ),
                            //     Align(
                            //       alignment: Alignment.bottomCenter,
                            //       child: Padding(
                            //         padding: EdgeInsets.only(top: 12),
                            //         child: ElevatedButton(
                            //           child: Text('Book Mark'),
                            //           onPressed: () async {},
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                            ),
                      ),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30, right: 0),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.black),
              child: FloatingActionButton(
                onPressed: () {
                  print(newsUrl);
                  // _launchUrl();
                  _launcherurl;                
                  
                },
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                child: Text(
                  'Read More',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              // Stack(
              //   children: [
              //     Positioned(
              //         bottom: 0,
              //         right: 0,
              //         left: 0,
              //         child: Center(
              //           child: FloatingActionButton(
              //             // shape: StadiumBorder(),
              //             onPressed: () {},
              //             child: Container(
              //               height: MediaQuery.of(context).size.height * 0.2,
              //               width: MediaQuery.of(context).size.width,
              //               decoration: BoxDecoration(),
              //               child: Center(
              //                   child: Text(
              //                 'Read More',
              //                 style: TextStyle(fontSize: 20),
              //               )),
              //             ),
              //           ),
              //         ))
              //   ],
              // )
              ),
        ));
  }
}
