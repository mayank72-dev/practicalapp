import 'package:apidemo/src/Api/api_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/product.dart';

class ProductNotifier extends ChangeNotifier{
  List<Product> productList = [];
  showProduct(List<Product>productList){
     this.productList = productList;
     notifyListeners();


  }
 initState()async{
   List<Product > data =await ApiService().getProduct();
   showProduct(data);
 }
}