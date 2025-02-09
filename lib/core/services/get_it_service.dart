

// GetIt service
import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
// Register services
void setupGetit() {
  getIt.registerSingleton<StorageService>(FireStorage());
}
