import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyItem extends StatefulWidget {
  var item;
  int? index;

  MyItem({this.item, this.index});

  @override
  State<MyItem> createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            widget.item[widget.index]['image'],
            height: 350,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                widget.item[widget.index]['name'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(widget.item[widget.index]['price'].toString() + ' \$'),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBar.builder(
                  itemSize: 9,
                  ignoreGestures: false,
                  initialRating: double.parse(
                      widget.item[widget.index]['rate'].toString()),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                CircleAvatar(
                  backgroundColor:
                      widget.item[widget.index]['faviorite'] == true
                          ? Colors.black
                          : Colors.grey.withOpacity(0.3),
                  radius: 12,
                  child: Center(
                    child: Icon(
                      widget.item[widget.index]['faviorite'] == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 10,
                      color: widget.item[widget.index]['faviorite'] == true
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
