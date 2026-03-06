import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:payrollapp/core/model/user_model/user_model.dart';
import 'package:payrollapp/feature/home/data/local/cart_local_repo.dart';
import 'package:payrollapp/feature/home/data/local/order_local_repo.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';

class CartController extends GetxController {
  final CartLocalRepo cartRepo;
  final OrderLocalRepo orderRepo;

  CartController({required this.cartRepo, required this.orderRepo});

  RxList<ProductModel> cartItems = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isPlacing = false.obs;

  RxInt totalItems = 0.obs;
  RxDouble totalAmount = 0.0.obs;
  Rxn<UserModel> user = Rxn();

  @override
  void onInit() {
    super.onInit();
    loadCart(shouldLoad: true);
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
      user.value = userData;
    });
  }

  Future<void> loadCart({bool shouldLoad = false}) async {
    if (shouldLoad) {
      isLoading.value = true;
    }

    final items = await cartRepo.getCartProducts();
    cartItems.assignAll(items);

    totalItems.value = await cartRepo.getCartCount();
    totalAmount.value = await cartRepo.getTotalAmount();

    if (shouldLoad) {
      isLoading.value = false;
    }
  }

  Future<void> addToCart(ProductModel product) async {
    await cartRepo.insertProductToCart(product);

    await loadCart();
  }

  Future<void> removeItem(int id) async {
    await cartRepo.removeFromCart(id);

    await loadCart();
  }

  Future<void> increaseQty(ProductModel product) async {
    await cartRepo.insertProductToCart(product);

    await loadCart();
  }

  Future<void> decreaseQty(int id, int currentQty) async {
    await cartRepo.updateQuantity(id, currentQty - 1);

    await loadCart();
  }

  Future<void> clearCart() async {
    await cartRepo.clearCart();
    await loadCart();
  }

  Future<void> placeOrder() async {
    isPlacing.value = true;
    await orderRepo.placeOrder(totalAmount: totalAmount.value);
    isPlacing.value = false;
  }
}
