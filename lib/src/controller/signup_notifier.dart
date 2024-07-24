import 'package:apidemo/src/Api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view/login_screen.dart';

class SignupNotifier  extends ChangeNotifier{
  final formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  checkvalidation(context){
   if(formkey.currentState!.validate()){
     final registeruser =  ApiService().register(email.text, password.text);
     Navigator.push(context, MaterialPageRoute(builder: (context)=>loginScreen()));
     print(registeruser);


   }else{
     print("Error data");
   }
   notifyListeners();
  }

}