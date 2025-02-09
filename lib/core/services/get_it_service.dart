// GetIt service
import 'package:fruits_hub_dashboard/core/repository/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repository/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repository/product_repo/product_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repository/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
// Register services
void setupGetit() {
  getIt.registerSingleton<StorageService>(FireStorage());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(
      getIt.get<StorageService>(),
    ),
  );
  getIt.registerSingleton<DatabaseService>(FirestoreService());

  getIt.registerSingleton<ProductsRepo>(
      ProductRepoImpl(getIt.get<DatabaseService>()));
}
