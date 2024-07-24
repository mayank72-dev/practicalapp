

import 'package:apidemo/src/controller/signup_notifier.dart';
import 'package:apidemo/src/view/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
SignupScreen()=>ChangeNotifierProvider(create: (_)=>SignupNotifier(), child: Builder(builder: (context)=>signupScreenProvider(context:context),),);
class signupScreenProvider extends StatelessWidget {
  const signupScreenProvider({Key? key , required BuildContext context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupNotifier>(builder: (context, state, child)=> Scaffold(
      body: Padding(padding:  EdgeInsets.all(10),
      child: Form(
        key: state.formkey,
        child: Column(children: [
          TextFormField(
            controller:  state.email,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          helperText: "Email"),),
          Padding(padding: EdgeInsets.only(top: 10)),
          TextFormField(
            controller: state.password,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              helperText: "password"),),
          Padding(padding: EdgeInsets.only(top: 10)),
          ElevatedButton(onPressed: (){
            state.checkvalidation(context);
          }, child: Text("Signup"),),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>loginScreen()));

            },
            child: Text("user Signup"),
          )

        ]),
      ),),
    ));
  }
}
