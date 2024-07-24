import 'package:apidemo/src/controller/postt_nptifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


PostScreen()=> ChangeNotifierProvider(create: (_)=>PosttNotifier(),child: Builder(builder: (context)=>PostScreenProvider(context:context),));
class PostScreenProvider extends StatelessWidget {
   PostScreenProvider({Key? key, required  BuildContext context}) : super(key: key){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var state = Provider.of<PosttNotifier>(context,listen: false);
      state.InitState();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PosttNotifier>(

        builder: (context,state, child)=> Scaffold(
      body: ListView.builder(
        controller: state.scrollController,
          itemCount: state.postList.length+1,
          itemBuilder: (context, index){
            if(index<state.postList.length){
              return ListTile(title: Text(state.postList[index].id.toString()),subtitle: Text(state.postList[index].title!),);
            }else{
              return Center(child: CircularProgressIndicator());
            }

      }),

    ));
  }
}
