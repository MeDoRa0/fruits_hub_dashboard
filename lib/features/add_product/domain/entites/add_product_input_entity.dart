import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entites/review_entity.dart';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expiryLimit;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avrageRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;

  AddProductInputEntity(
      {required this.name,
      required this.code,
      required this.description,
      required this.price,
      required this.reviews,
      required this.image,
      this.isOrganic = false,
      required this.isFeatured,
      this.imageUrl,
      required this.expiryLimit,
      required this.numberOfCalories,
      required this.unitAmount});
}
