

import 'package:apidemo/src/controller/home_notifier.dart';
import 'package:apidemo/src/view/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
HomeScreen()=> ChangeNotifierProvider(create: (_)=>HomeNotifier(),child: Builder(builder: (context)=>homeScreenProvider(context:context),));
class homeScreenProvider extends StatelessWidget {
   homeScreenProvider({Key? key, required BuildContext context}) : super(key: key){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var state = Provider.of<HomeNotifier>(context,listen: false);
      state.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, state, child)=> Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(

          children: [
         /*   Container(
              height: 600,
              
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.productList.length,
                  itemBuilder: (context, index){
                  var data =state.productList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(data:data)));
                  },
                    child: Card(child: ListTile(
                      leading: Container(
                          height: 100,
                          width:100,
                          child: Image.network(state.productList[index].thumbnail!,fit: BoxFit.cover,)),
                      title: Text(state.productList[index].title!),subtitle: Text(state.productList[index].category!),


                    )),
                  ),
                );
              }),
            )*/
            
            SizedBox(height: 20,),



           /* Container(
              height: 400,
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: state.userList.length,
                  itemBuilder: (context, index){
                return Padding(padding: EdgeInsets.all(8),
                child: Card(child: ListTile(title: Text(state.userList[index].name!),
                subtitle: Text(state.userList[index].phone!),)),);
              }),
            )*/
            
            Container(
              height: 500,
              child: GridView.builder(
                itemCount: state.productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0
                ),
                itemBuilder: (BuildContext context, int index){
                  return Image.network(state.productList[index].thumbnail!);
                },
              )),

       ]),
            )
            

        ),
        ),

    );
  }
}
