import 'package:ecommerce/presentation/cubit/home_layer/tabs/cart_view/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../widgets/product_tab/custom_cart_item.dart';

class CartView extends StatefulWidget {
  CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late Cart_FavoriteCubit cartCubit;

  @override
  void initState() {
    cartCubit = Cart_FavoriteCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return BlocBuilder<Cart_FavoriteCubit, CartState>(
      bloc: cartCubit..getFromCart(),
      builder: (context, state) {
        if (cartCubit.productList.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text("Cart"),
              centerTitle: true,
              titleTextStyle: theme.textTheme.bodyLarge!
                  .copyWith(fontSize: 20, color: const Color(0xff06004F)),
            ),
            body: Center(
              child: Text("Cart is Empty",
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.primaryColor)),
            ),
          );
        }
        if (state is CartSuccessState) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text("Cart"),
              centerTitle: true,
              titleTextStyle: theme.textTheme.bodyLarge!
                  .copyWith(fontSize: 20, color: const Color(0xff06004F)),
            ),
            backgroundColor: Colors.white,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: cartCubit.productList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: CustomCartItem(
                              data: cartCubit.productList[index],
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total price",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  color: Color(0xff06004F).withOpacity(0.7)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "EGP "
                              "${cartCubit.totalPrice}",
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(color: Color(0xff06004F)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 48,
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Check Out",
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          );
        } else if (state is DeleteItemOfCartSuccessState) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text("Cart"),
              centerTitle: true,
              titleTextStyle: theme.textTheme.bodyLarge!
                  .copyWith(fontSize: 20, color: const Color(0xff06004F)),
            ),
            backgroundColor: Colors.white,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: cartCubit.productList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: CustomCartItem(
                              data: cartCubit.productList[index],
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total price",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  color: Color(0xff06004F).withOpacity(0.7)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "EGP "
                              "${cartCubit.totalPrice}",
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(color: Color(0xff06004F)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 48,
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Check Out",
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          );
        } else if (state is UpdateCountOfCartSuccessState) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text("Cart"),
              centerTitle: true,
              titleTextStyle: theme.textTheme.bodyLarge!
                  .copyWith(fontSize: 20, color: const Color(0xff06004F)),
            ),
            backgroundColor: Colors.white,
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: cartCubit.productList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: CustomCartItem(
                              data: cartCubit.productList[index],
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total price",
                              style: theme.textTheme.bodyLarge!.copyWith(
                                  color: Color(0xff06004F).withOpacity(0.7)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "EGP "
                              "${cartCubit.totalPrice}",
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(color: Color(0xff06004F)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {},
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 48,
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Check Out",
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          );
        } else {
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text("Cart"),
                centerTitle: true,
                titleTextStyle: theme.textTheme.bodyLarge!
                    .copyWith(fontSize: 20, color: const Color(0xff06004F)),
              ),
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              ));
        }
      },
    );
  }
}
