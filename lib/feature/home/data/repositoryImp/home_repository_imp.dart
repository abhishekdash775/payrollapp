import 'package:payrollapp/core/constant/app_endpoints.dart';
import 'package:payrollapp/core/network/api_call_handler.dart';
import 'package:payrollapp/core/service/api_client.dart';
import 'package:payrollapp/core/model/query_params.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';
import 'package:payrollapp/feature/home/data/response/fetch_product.dart';
import 'package:payrollapp/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final AppEndpoints _endpoints;
  final ApiClient _apiClient;

  HomeRepositoryImp({
    required AppEndpoints endpoints,
    required ApiClient apiClient,
  }) : _endpoints = endpoints,
       _apiClient = apiClient;

  @override
  Future<ApiCallHandler<FetchProduct>> fetchProductListing(QueryParams query) {
    return _apiClient.get<FetchProduct>(
      path: _endpoints.product,
      queryParameters: query.toJson(),
      fromJson: (json) => FetchProduct.fromJson(json),
    );
  }
  
  @override
  Future<ApiCallHandler<ProductModel>> fetchProductById({required num id}) {
    return _apiClient.get<ProductModel>(
      path: "${_endpoints.product}/$id",
      fromJson: (json) => ProductModel.fromJson(json),
    );
  }
}
