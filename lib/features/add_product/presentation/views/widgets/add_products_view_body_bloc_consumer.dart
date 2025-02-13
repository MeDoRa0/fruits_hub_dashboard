import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_function/build_error_bar.dart';
import 'package:fruits_hub_dashboard/core/utils/custom_progress_hud.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductsViewBodyBlocConsumer extends StatelessWidget {
  const AddProductsViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildBar(context, 'تم اضافة المنتج بنجاح');
        }
        if (state is AddProductFailure) {
          buildBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
            isLoading: state is AddProductLoading, child: AddProductViewBody());
      },
    );
  }
}
