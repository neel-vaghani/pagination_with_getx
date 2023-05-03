// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_with_getx/module/home/dependency/home_screen_dependency.dart';

import '../widget/home_screen_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController listController = ScrollController();

  // CONTROLLER LISTENER
  controllerListener() async {
    listController.addListener(() {
      if (listController.position.maxScrollExtent ==
          listController.position.pixels) {
        kHomeScreenController.getPostsDataFromApi(
          context: context,
          getDataFrom: kHomeScreenController.postsDataList.length,
        );
      }
    });
  }

  @override
  void initState() {
    // GET FIRST TIME DATA
    kHomeScreenController.getPostsDataFromApi(
        context: context, showMainLoader: true);
    //
    controllerListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagination Demo"),
      ),
      body: Obx(
        () => kHomeScreenController.isFetchingPostsDataMainLoader.value
            ? Center(child: CupertinoActivityIndicator())
            : ListView.separated(
                controller: listController,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) => HomeScreenListTile(
                  postData: kHomeScreenController.postsDataList[index],
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: kHomeScreenController.postsDataList.length,
              ),
      ),
    );
  }
}
