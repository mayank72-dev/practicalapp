import 'package:apidemo/src/model/product.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  ProductItem? data;
   DetailsScreen({Key? key,  this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(children: [
        Container(
          child:Image.network(data!.thumbnail!),
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(data!.title!)
          ]),),
    );
  }
}
