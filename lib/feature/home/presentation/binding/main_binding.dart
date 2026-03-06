import 'package:get/get.dart';
import 'package:payrollapp/core/constant/app_endpoints.dart';
import 'package:payrollapp/core/service/api_client.dart';
import 'package:payrollapp/feature/home/data/local/cart_local_repo.dart';
import 'package:payrollapp/feature/home/data/local/order_local_repo.dart';
import 'package:payrollapp/feature/home/data/local/product_local_repo.dart';
import 'package:payrollapp/feature/home/data/repositoryImp/home_repository_imp.dart';
import 'package:payrollapp/feature/home/presentation/controller/cart_controller.dart';
import 'package:payrollapp/feature/home/presentation/controller/home_screen_controller.dart';
import 'package:payrollapp/feature/home/presentation/controller/main_controller.dart';
import 'package:payrollapp/feature/home/presentation/controller/order_controller.dart';
import 'package:payrollapp/feature/home/presentation/controller/profile_controller.dart';

class MainBinding extends Bindings {
  AppEndpoints appEndpoints = AppEndpoints();

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut( () => MainController());
    Get.lazyPut(
      
      () => HomeScreenController(
        homeRepository: HomeRepositoryImp(
          endpoints: appEndpoints,
          apiClient: ApiClient(),
        ),
        localRepo: ProductLocalRepo(),
      ),
    );
    Get.lazyPut(
      () => OrderController(orderRepo: OrderLocalRepo()),
    );
    Get.lazyPut(
      () => CartController(
        cartRepo: CartLocalRepo(),
        orderRepo: OrderLocalRepo(),
      ),

    );
    Get.lazyPut(() => ProfileController());
  }
}
