import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repository/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repository/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(ProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.image);
    result.fold((f) {
      emit(AddProductFailure(errorMessage: f.message));
    }, (url) async {
      addProductInputEntity.imageUrl = url;
      var result = await productsRepo.addProduct(addProductInputEntity);
      result.fold((f) {
        emit(
          AddProductFailure(errorMessage: f.message),
        );
      }, (r) {
        emit(AddProductSuccess());
      });
    });
  }
}
