import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuers.dart';
import 'package:fruits_hub_dashboard/core/repository/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/model/add_product_input_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/add_product_input_entity.dart';

class ProductRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failuers, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
          path: BackendEndpoint.productsCollection,
          data:
              AddProductInputModel.fromEntity(addProductInputEntity).toJson());
      return const Right(null);
    } on Exception catch (e) {
      return Left(
        ServerFailuer(
          message: e.toString(),
        ),
      );
    }
  }
}
