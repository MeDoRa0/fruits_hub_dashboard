import 'package:fruits_hub_dashboard/features/add_product/presentation/views/domain/entites/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<void> addProduct(AddProductInputEntity addProductInputEntity);
}
