import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuers.dart';
import 'package:fruits_hub_dashboard/core/repository/images_repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failuers, String>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }

}