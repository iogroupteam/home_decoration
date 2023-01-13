import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homeware_store/View/Components/item.dart';
import 'package:homeware_store/View/Home/selectItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async { 
      await loadJson();
    });
    super.initState();
  }



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
          child: Column(
            children: [
             Padding(
               padding: const EdgeInsets.only(
                top: 45,
                left: 40,
                right: 40
               ),
               child: Column(
                children: [
                   Row(
                  children: [
                    Image.asset('assets/icons/8.png',height: myHeight*0.05,color: Colors.grey.withOpacity(0.8),),
                  ],
                ),
                SizedBox(
                  height: myHeight*0.03,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.5))
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'type to search...',
                            contentPadding: EdgeInsets.symmetric(horizontal: myWidth*0.05)
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Image.asset('assets/icons/9.png',height: myHeight*0.02,color: Colors.white,),
                          ),
                        ))
                    ],
                  )),
                  SizedBox(
                    height: myHeight*0.04,
                  ),
                  Row(
                    children: [
                      Text('Discover \nour new items',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    ],
                  ),
                   SizedBox(
                    height: myHeight*0.04,
                  ),
                ],
               ),
             ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10
                  ),
                  child: 
                  myJson == null ? Center(
                    child: CircularProgressIndicator(),
                  ):
                  GridView.builder(
                    itemCount: myJson.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.4,
                      mainAxisSpacing: 0.5,
                      crossAxisSpacing: 10
                      ), 
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectItem(selectItem: myJson[index],)));
                        },
                        child: MyItem(item: myJson,index: index,));
                    },
                    ),
                ))
            ],
          ),
        ),
      ),
    );
  }

  var myJson;


  loadJson()async{

    String data = await rootBundle.loadString('assets/json/items.json');
    setState(() {
      myJson = json.decode(data);
    });

  }



}
