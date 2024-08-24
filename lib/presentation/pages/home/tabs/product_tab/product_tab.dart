import 'package:ecommerce/core/widgets/custom_search_text_field.dart';

import 'package:ecommerce/presentation/cubit/home_layer/tabs/cart_view/cart_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/use_case/cart_use_case/add_to_cart_use_case.dart';
import '../../../../../domain/use_case/product_tab_use_case/get_all_product_use_case.dart';
import '../../../../cubit/home_layer/tabs/product_tab/product_cubit.dart';
import '../../../../widgets/product_tab/custom_product_item.dart';

class ProductTab extends StatefulWidget {
  ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  late ProductCubit productCubit;

  late Cart_FavoriteCubit cartCubit;

  void initState() {
    productCubit = ProductCubit(
        getAllProductUseCase: injectGetAllProductUseCase(),
        addToCartUseCase: injectAddToCartUseCase());

    cartCubit = Cart_FavoriteCubit.get(context);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocProvider<ProductCubit>(
      create: (context) => productCubit..getAllProduct(),
      child: BlocBuilder<ProductCubit, ProductState>(
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
                    ? Expanded(
                        child: Center(
                            child: CircularProgressIndicator(
                          color: theme.primaryColor,
                        )),
                      )
                    : Expanded(
                        child: GridView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16.w,
                                    mainAxisSpacing: 16.h,
                                    childAspectRatio: 2 / 2.5),
                            itemCount: productCubit.listOfProduct!.length,
                            itemBuilder: (context, index) {
                              return BlocBuilder<Cart_FavoriteCubit, CartState>(
                                builder: (context, state) {
                                  var cartList = cartCubit.productList;
                                  var productList =
                                      productCubit.listOfProduct![index];
                                  var favoriteList = cartCubit.favoriteList;

                                  bool inCart = false;
                                  bool isFavorite = false;
                                  int count = 0;

                                  if (cartList.isNotEmpty) {
                                    for (int i = 0; i < cartList.length; i++) {
                                      if (productList.id ==
                                          cartList[i].product!.id) {
                                        inCart = true;
                                        count = cartList[i].count ?? 0;
                                      }
                                    }
                                  }
                                  if (favoriteList.isNotEmpty) {
                                    for (int i = 0;
                                        i < favoriteList.length;
                                        i++) {
                                      if (productList.id ==
                                          favoriteList[i].id) {
                                        isFavorite = true;
                                      }
                                    }
                                  }

                                  return CustomProductItem(
                                    count: count,
                                    data: productList,
                                    inCart: inCart,
                                    isFavorite: isFavorite,
                                  );
                                },
                              );
                            }),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
