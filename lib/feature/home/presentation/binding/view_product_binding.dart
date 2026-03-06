import 'package:get/get.dart';
import 'package:payrollapp/core/constant/app_endpoints.dart';
import 'package:payrollapp/core/service/api_client.dart';
import 'package:payrollapp/feature/home/data/local/cart_local_repo.dart';
import 'package:payrollapp/feature/home/data/local/product_local_repo.dart';
import 'package:payrollapp/feature/home/data/repositoryImp/home_repository_imp.dart';
import 'package:payrollapp/feature/home/presentation/controller/view_product_controller.dart';

class ViewProductBinding extends Bindings {
  AppEndpoints appEndpoints = AppEndpoints();

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ViewProductController>(
      () => ViewProductController(
        homeRepository: HomeRepositoryImp(
          endpoints: appEndpoints,
          apiClient: ApiClient(),
        ),
        cartRepo: CartLocalRepo(),
      ),
    );
  }
}
