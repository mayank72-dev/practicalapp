import 'package:apidemo/src/Api/api_service.dart';
import 'package:apidemo/src/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier{
  final formkey = GlobalKey<FormState>();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();



checkValidation(context) {
  if (formkey.currentState!.validate()){
    print("ok");
  final login =  ApiService().login(email.text, password.text);
  Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
  print("====login${login}");

  }else{
    print("errordata");
  }
  notifyListeners();
  }

}