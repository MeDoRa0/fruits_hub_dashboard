import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failuers.dart';

abstract  class ImagesRepo {

    Future<Either<Failuers, String>> uploadImage(File image);
   
}