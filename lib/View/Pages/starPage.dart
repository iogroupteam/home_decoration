import 'package:flutter/material.dart';

class StarPage extends StatefulWidget {
  const StarPage({ Key? key }) : super(key: key);

  @override
  State<StarPage> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('StarPage'),
      ),
    );
  }
}