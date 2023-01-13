import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SelectItem extends StatefulWidget {
  var selectItem;

  SelectItem({this.selectItem});

  @override
  State<SelectItem> createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: myHeight,
          width: myWidth,
          child: Padding(
            padding: const EdgeInsets.only(top: 45, left: 40, right: 40),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              'assets/icons/8.png',
                              height: myHeight * 0.05,
                              color: Colors.grey.withOpacity(0.8),
                            ),
                          ),
                          Icon(
                            Icons.menu,
                            color: Colors.grey.withOpacity(0.8),
                          )
                        ],
                      ),
                      Container(
                        height: myHeight * 0.3,
                        width: myWidth,
                        child: Image.asset(
                          widget.selectItem["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: myHeight * 0.02,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Reviews',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                RatingBar.builder(
                                  itemSize: 9,
                                  ignoreGestures: false,
                                  initialRating: double.parse(
                                      widget.selectItem['rate'].toString()),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                            Text(
                              widget.selectItem["price"].toString() + ' \$',
                              style: TextStyle(fontSize: 30),
                            )
                          ]),
                      SizedBox(
                        height: myHeight * 0.03,
                      ),
                      Text(
                        widget.selectItem['subTitle'],
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: myHeight * 0.03,
                      ),
                      Text(
                        widget.selectItem["description"],
                        style: TextStyle(
                            color: Colors.grey, fontSize: 18, height: 2.5),
                      )
                    ],
                  ),
                ),
                Container(
                  // color: Colors.red,
                  height: myHeight * 0.1,
                  width: myWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: widget.selectItem['faviorite'] == true
                            ? Colors.black
                            : Colors.grey.withOpacity(0.3),
                        radius: 20,
                        child: Center(
                          child: Icon(
                            widget.selectItem['faviorite'] == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 15,
                            color: widget.selectItem['faviorite'] == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                        decoration:BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: Row(
                          children: [
                            Text('Add to cart',style: TextStyle(fontSize: 20,color: Colors.white),),

                            SizedBox(
                              width: 15,
                            ),

                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white.withOpacity(0.2),
                              child: Image.asset('assets/icons/5.png',height: 20,color: Colors.white,)
                            )
                          ],
                        ),
                      )
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


