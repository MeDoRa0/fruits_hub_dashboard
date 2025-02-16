import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/data/model/review_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/add_product_input_entity.dart';

class AddProductInputModel {
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
  final List<ReviewModel> reviews;

  AddProductInputModel(
      {required this.name,
      required this.code,
      required this.description,
      required this.price,
      required this.image,
      required this.isFeatured,
      required this.reviews,
      this.imageUrl,
      required this.expiryLimit,
      this.isOrganic = false,
      required this.numberOfCalories,
      required this.unitAmount});

  factory AddProductInputModel.fromEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductInputModel(
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      expiryLimit: addProductInputEntity.expiryLimit,
      isOrganic: addProductInputEntity.isOrganic,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      // 'image': image,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expiryLimit': expiryLimit,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
