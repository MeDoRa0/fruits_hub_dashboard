import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuers.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failuers, void>> addProduct(
      ProductInputEntity addProductInputEntity);
}
