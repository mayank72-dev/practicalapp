import 'dart:convert';

import 'package:apidemo/src/model/product.dart';
import 'package:apidemo/src/model/users.dart';

import '../model/login_modek.dart';
import '../model/post.dart';
import 'package:http/http.dart'as http;

class ApiService {
  /// post api call
  Future<List<Post>> getpost() async {
    List<Post> postList = [];
    var res = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (res.statusCode == 200) {
      var data = res.body;
      print("=== data${res.body}");
      List<dynamic>postdata = jsonDecode(data);
      postdata.forEach((element) {
        Post post = Post.fromJson(element);
        postList.add(post);
        print("==postList=====${postList.length}");
      });
      return postList;
    } else {
      print("Error");
    }
    return [];
  }

  /// users 


  Future<List<Users>> getUser() async {
    List<Users> userList = [];

    var res = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (res.statusCode == 200) {
      var data = res.body;
      List<dynamic> userdata = jsonDecode(data);
      userdata.forEach((element) {
        Users users = Users.fromJson(element);
        userList.add(users);
      });
      return userList;
    } else {
      print("Error");
    }
    return [];
  }

  /// procuct
  Future<List<Product>> getProduct() async {
    List<Product> productList = [];
    var res = await http.get(
        Uri.parse("https://api.escuelajs.co/api/v1/products"));

    if (res.statusCode == 200) {
      var data = res.body;
      List<dynamic> productdata = jsonDecode(data);
      productdata.forEach((element) {
        Product product = Product.fromJson(element);
        productList.add(product);
      });
      return productList;
    } else {
      print("Error");
    }
    return [];
  }

  ///  register user
  Future<void> register(String email, String password) async {
    final res = await http.post(Uri.parse("https://reqres.in/api/register"),
        body: { "email": email,
          'password': password}


    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print("===${data}");
    } else {
      print("Errror");
    }
  }


  ///login
  Future<void> login(String email, String password) async {
    final res = await http.post(Uri.parse("https://reqres.in/api/login"),
        body: { "email": email,
          'password': password}
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print("===  login${data}");
    } else {
      print("Errror");
    }
  }


  /// product mobaile
  Future<List<ProductItem>> getProductItem() async {
    List<ProductItem> productItemList = [];

    var res = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (res.statusCode == 200) {
      var data = res.body;
      List<dynamic> itemList = jsonDecode(data)['products'];
      itemList.forEach((element) {
        ProductItem productItem = ProductItem.fromJson(element);
        productItemList.add(productItem);
      });
      return productItemList;
    } else {
      print("Error");
      return [];
    }
  }


/// fetch category
/*Future<void>fetchcategory()async{
  Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products");
  try{
    final res = await http.get(url);
    List<dynamic> data= jsonDecode(res.body);

    final List<String> fetchcategory =["All"];

    for(var product in data){
      final String category = product["category"];
      if

    }
  }catch(e){

  }

}*/
}
