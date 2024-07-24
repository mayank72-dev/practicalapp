import 'package:apidemo/src/controller/login_notifier.dart';
import 'package:apidemo/src/view/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
loginScreen()=>ChangeNotifierProvider(create: (_)=>LoginNotifier(), child: Builder(builder: (context)=>LoginScreenProvider(context:context),),);
class LoginScreenProvider extends StatelessWidget {
  const LoginScreenProvider({Key? key, required BuildContext context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(builder: (context, state, child)=> Scaffold(
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
              state.checkValidation(context);
            }, child: Text("login"),),
            Padding(padding: EdgeInsets.only(top: 10)),
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));

           },
           child: Text("user Signup"),
         )
          ]),
        ),),
    ));
  }
}
