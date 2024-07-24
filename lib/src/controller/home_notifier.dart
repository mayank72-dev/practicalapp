import 'package:apidemo/src/model/product.dart';
import 'package:apidemo/src/model/users.dart';
import 'package:flutter/foundation.dart';

import '../Api/api_service.dart';
import '../model/post.dart';

class HomeNotifier extends ChangeNotifier{
List<Post> postList= [];
List<Users> userList= [];
/// product List
List<ProductItem> productList = [];

showpost(List<Post> postlist){
  this. postList = postlist;
   print("===List${postList.length}");
   notifyListeners();

}

///SHOW user
showuser(List<Users> userList) {
  this.userList = userList;
  notifyListeners();
}

  ///  showproduct Item
  showProductItem(List<ProductItem>productList){
   this.productList = productList;
   notifyListeners();
  }

initState()async {
  List<Post> data =await  ApiService().getpost();
  showpost(data);
  List<Users> userdata = await  ApiService().getUser();
  showuser(userdata);
  print("===List${data}");
  List<ProductItem> productdata=  await ApiService().getProductItem();
  showProductItem(productdata);
}

}