import 'package:flutter/material.dart';

import '../models/caurisolCardModel.dart';

class CategoryCard extends StatefulWidget {
  CauroisalCardModel? data;
  final VoidCallback ontap;
  CategoryCard({super.key, 
  this.data,
  required this.ontap});

  

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(widget.data!.ImageUrl.toString()),
            )),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 20),
                child: Text(
                  widget.data!.Data.toString(),
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'Poppins'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
