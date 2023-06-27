import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home_controller.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Api",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: GetBuilder(
        init: HomeController(),
        builder: (HomeController controller) {
          return ListView.builder(
            itemCount: controller.postList.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: Text("${controller.postList[index].id}"),
              ),
              title: Text(
                "${controller.postList[index].title}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Text("${controller.postList[index].body}"),
            ),
          );
        },
      ),
    );
  }
}
