import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuers.dart';
import 'package:fruits_hub_dashboard/core/repository/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl(this.storageService);
  @override
  Future<Either<Failuers, String>> uploadImage(File image) async {
    try {
      String url =
          await storageService.uploadFile(image, BackendEndpoint.images);
      return Right(url);
    } on Exception catch (e) {
      return Left(
        ServerFailuer(
          message: e.toString(),
        ),
      );
    }
  }
}
