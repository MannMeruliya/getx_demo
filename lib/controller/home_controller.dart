import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx/model/PostApi.dart';
import 'package:getx/model/utils.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<Post> postList = [];
  bool isLoading = false;

  getAllPost() async {
    isLoading = true;
    Uri url = Uri.parse(ApiUtils.URL + ApiUtils.product);
    var response = await http.get(url);
    postList.clear();
    if (response.statusCode == 200) {
      postList = postFromJson(response.body);
      // print("postList. length :: ${postList.length}");
      print(postList);
      isLoading = false;
    } else {
      Fluttertoast.showToast(
        msg: "something wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
      isLoading = false;
    }
  }
}
