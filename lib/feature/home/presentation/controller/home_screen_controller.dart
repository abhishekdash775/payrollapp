import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:payrollapp/core/model/user_model/user_model.dart';
import 'package:payrollapp/core/network/api_call_handler.dart';
import 'package:payrollapp/core/utility/custom_debouncer.dart';
import 'package:payrollapp/feature/home/data/local/product_local_repo.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';
import 'package:payrollapp/core/model/query_params.dart';
import 'package:payrollapp/feature/home/domain/repository/home_repository.dart';

class HomeScreenController extends GetxController {
  final HomeRepository homeRepository;
  final ProductLocalRepo localRepo;
  HomeScreenController({required this.homeRepository, required this.localRepo});

  List<ProductModel> items = [];
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool hasMore = true;
  bool isLoading = false;
  bool isInitialLoading = true;
  String? userName = "";
  int currentPage = 1;
  int limit = 10;
  int skip = 0;
  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance.collection("users").doc(uid).snapshots().listen((
      doc,
    ) {
      final data = doc.data();
      if (data == null) return;
      final userData = UserModel.fromJson(data);
      userName = userData.name;
      update();
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getProductList();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
              scrollController.position.maxScrollExtent - 200 &&
          hasMore &&
          !isLoading) {
        getProductList();
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    searchController.dispose();
    super.onClose();
  }

  void searchProduct() async {
    final _debouncer = CustomDebouncer(milliseconds: 500);
    if (searchController.text.length > 3) {
      currentPage = 1;
      items.clear();
      hasMore = true;
      update();
      _debouncer.run(getProductList);
    }
  }

  Future<void> onRefresh() async {
    currentPage = 1;
    items.clear();
    hasMore = true;
    update();

    await getProductList();
  }

  Future<void> getProductList() async {
    isLoading = true;
    update();
    skip = (currentPage - 1) * limit;
    final result = await homeRepository.fetchProductListing(
      QueryParams(limit: limit, search: searchController.text, skip: skip),
    );
    await result.handle(
      tag: "ProductListing",
      onSuccess: (data) async {
        final newItems = data.products ?? [];

        if (currentPage == 1) {
          items = newItems;
          isInitialLoading = false;
          update();
        } else {
          items.addAll(newItems);
        }
        hasMore = newItems.length == limit;
        if (hasMore) currentPage++;
        // await localRepo.insertPageProducts(newItems, currentPage);
      },
      onError: (message) async {
        // final offlineProducts = await localRepo.getProductsByPage(currentPage);
        // if (offlineProducts.isNotEmpty) {
        //   items.addAll(offlineProducts);
        //   currentPage++;
        // } else {
        //   hasMore = false;
        // }
        Get.snackbar("Error", message, snackPosition: SnackPosition.BOTTOM);
      },
    );
    isLoading = false;
    update();
  }
}
