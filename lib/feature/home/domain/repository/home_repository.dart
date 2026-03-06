import 'package:payrollapp/core/network/api_call_handler.dart';
import 'package:payrollapp/core/model/query_params.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';
import 'package:payrollapp/feature/home/data/response/fetch_product.dart';

abstract class HomeRepository {
  Future<ApiCallHandler<FetchProduct>> fetchProductListing(QueryParams query);
  Future<ApiCallHandler<ProductModel>> fetchProductById({required num id});
}
