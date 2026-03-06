import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:payrollapp/core/model/aurgument_model.dart';
import 'package:payrollapp/core/network/api_call_handler.dart';
import 'package:payrollapp/feature/home/data/local/cart_local_repo.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';
import 'package:payrollapp/feature/home/domain/repository/home_repository.dart';

class ViewProductController extends GetxController {
  final HomeRepository homeRepository;
  final CartLocalRepo cartRepo;
  ViewProductController({required this.homeRepository, required this.cartRepo});

  ProductModel? product;
  late num productId;
  bool isLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final arg = Get.arguments;
    if (arg is AurgumentModel && arg.id != null) {
      productId = arg.id!;
      fetchProductById();
    }
  
  }

  Future<void> addToCart() async {
    isLoading = true;
    await cartRepo.insertProductToCart(product ?? ProductModel());
    isLoading = false;
    Get.snackbar(
      "Success",
      "Product added to cart",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
  }

  Future<void> fetchProductById() async {
    isLoading = true;
    update();
    final result = await homeRepository.fetchProductById(id: productId);
    result.handle(
      tag: "[fetchProductById]",
      onSuccess: (data) async {
        product = data;
      },
      onError: (message) async {
        Get.snackbar("Error", message);
      },
    );
    isLoading = false;
    update();
  }
}
