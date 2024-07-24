import 'dart:convert';

import 'package:apidemo/src/Api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import '../model/post.dart';

class PosttNotifier extends ChangeNotifier{
  List<Post>postList= [];
  int page =1;
  ScrollController scrollController =ScrollController();

  showPost(List<Post>postList ){
    this.postList=postList;
    notifyListeners();


  }
  InitState()async{
  List<Post> data = await getpostt();
  showPost(data);
  scrollController.addListener(() {
    if(scrollController.position.maxScrollExtent==scrollController.offset){
      page++;
      getpostt();
      print("====${page}");
    }
  });
getpostt();
notifyListeners();
  }

  /// post_pagination

  Future<List<Post>> getpostt() async {
    int limit = 25;

    List<Post> postList = [];


    var res = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page$page"));
    if (res.statusCode == 200) {
      var data = res.body;
      List<dynamic> postListitem = jsonDecode(data);
      postListitem.forEach((element) {
        Post post = Post.fromJson(element);
        postList.add(post);
      });
      return postList;
    } else {
      print("error data");
    }
    return [];
  }
}

