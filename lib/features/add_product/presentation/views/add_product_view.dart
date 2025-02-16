import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repository/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repository/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';

import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_products_view_body_bloc_consumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const String routeName = 'add_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'إضافة منتج',
      ),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImagesRepo>(),
          getIt.get<ProductsRepo>(),
        ),
        child: AddProductsViewBodyBlocConsumer(),
      ),
    );
  }
}
