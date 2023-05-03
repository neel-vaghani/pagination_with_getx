import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_with_getx/module/home/infrastructure/home_screen_infra.dart';

import '../model/posts_data_model.dart';

class HomeScreenController extends GetxController {
  // void onInit() {
  //   controllerListener();
  //   super.onInit();
  // }

  // DATA .
  RxList<PostsDataModel> postsDataList = <PostsDataModel>[].obs;
  // ScrollController listController = ScrollController();
  int listDataLimit = 10;

  // FLAG .
  RxBool isFetchingPostsDataMainLoader = false.obs;
  RxBool isFetchingPostsDataPaginationLoader = false.obs;

  // GET POSTS DATA
  Future<void> getPostsDataFromApi({
    required BuildContext context,
    int? getDataFrom,
    bool? showMainLoader,
  }) async {
    // LOADER START
    isFetchingPostsDataMainLoader.value = showMainLoader ?? false;
    Either<List<PostsDataModel>, String?> successOrFail =
        await HomeScreenInfra.getPostsData(
            dataLengthLimit: listDataLimit, getDataFrom: getDataFrom ?? 0);
    // SUCCESS .
    successOrFail.fold(
      (success) {
        postsDataList.addAll(success);
      },
      // FAIL .
      (fail) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(fail ?? ''),
          ),
        );
      },
    );
    // LOADER STOP
    isFetchingPostsDataMainLoader.value = false;
  }
}
