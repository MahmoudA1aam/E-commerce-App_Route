import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_search_text_field.dart';
import '../../../../../domain/use_case/product_tab_use_case/get_all_product_use_case.dart';
import '../../../../cubit/home_layer/tabs/product_tab/product_cubit.dart';
import '../../../../widgets/product_tab/custom_product_section.dart';

class ProductTab extends StatefulWidget {
  ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  late ProductCubit productCubit;

  void initState() {
    productCubit =
        ProductCubit(getAllProductUseCase: injectGetAllProductUseCase());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<ProductCubit, ProductState>(
      bloc: productCubit..getAllProduct(),
      builder: (context, state) {

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            children: [
              CustomSearchTextField(),
              SizedBox(
                height: 16.h,
              ),
              state is ProductLoadingState
                  ? Center(
                      child: CircularProgressIndicator(
                      color: theme.primaryColor,
                    ))
                  : CustomProductSection(list: productCubit.listOfProduct ?? [])
            ],
          ),
        );
      },
    );
  }
}
