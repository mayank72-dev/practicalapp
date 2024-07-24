


import 'package:apidemo/src/controller/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

ProductScreen()=>ChangeNotifierProvider(create: (_)=>ProductNotifier(), child: Builder(builder: (context)=>ProductScreenProvider(context:context)),);

class ProductScreenProvider extends StatelessWidget {
   ProductScreenProvider({Key? key, required BuildContext context}) : super(key: key){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var state = Provider.of<ProductNotifier>(context, listen: false);
     state.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductNotifier>(builder: (context, state, child)=> Scaffold(
      body:  Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child:  Column(
        children: [


          ListView.builder(
            shrinkWrap: true,
              itemCount: state.productList.length,
              itemBuilder: (context, index){
            return Padding(padding: EdgeInsets.all(8),
            child: Column(
              children: [
                InkWell(
                onTap: (){},

                  child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)),
            child: Image.network(state.productList[index].images.toString(),width: 100,height: 100,fit: BoxFit.cover,),
                  ),
                ),
            Padding(padding:EdgeInsets.only(top: 10)),
            Text(state.productList[index].title!),
            Padding(padding:EdgeInsets.only(top: 10) ),
                Text(state.productList[index].description!),

              ],
            ));
          }
          ),
        ],
      ),
      ),
    ));
  }
}
