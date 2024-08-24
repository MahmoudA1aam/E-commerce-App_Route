import 'package:ecommerce/core/cofig/page_route_name.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';
import 'package:ecommerce/presentation/cubit/home_layer/tabs/cart_view/cart_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/data_model/product_details_model.dart';

class CustomProductItem extends StatefulWidget {
   CustomProductItem(
      {super.key,
      required this.data,
      required this.inCart,
      required this.isFavorite,
        this.count
      });

  final ProductDataEntity data;
  final bool inCart;
  final bool isFavorite;
  int? count;


  @override
  State<CustomProductItem> createState() => _CustomProductItemState();
}

class _CustomProductItemState extends State<CustomProductItem> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 237.h,
      width: 191.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.sp))),
      child: Stack(
        alignment: const Alignment(0.9, -0.9),
        children: [
          GestureDetector(
            onTap: () {
              ProductDetailsModel data = ProductDetailsModel(
                count: widget.count??0,

                  urlImage: widget.data.images,
                  title: widget.data.title,
                  description: widget.data.description,
                  price: widget.data.price,
                  sold: widget.data.sold,
                  quantity: widget.data.quantity,
                  ratingsAverage: widget.data.ratingsAverage,
                  ratingsQuantity: widget.data.ratingsQuantity,
                  id: widget.data.id,
                  inCart: widget.inCart);
              Navigator.pushNamed(context, PageRouteName.productDetails,
                  arguments: data);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.sp),
                      topRight: Radius.circular(15.sp)),
                  child: Image.network(
                    widget.data.imageCover ?? '',
                    height: 128.h,
                    width: 191.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.data.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelMedium!.copyWith(
                            fontSize: 14,
                            color: const Color(0xff06004F),
                          )),
                      Text("EGP ${widget.data.price}",
                          style: theme.textTheme.labelMedium!.copyWith(
                            fontSize: 14,
                            color: const Color(0xff06004F),
                          )),
                      Row(
                        children: [
                          Text(
                            "Review (${widget.data.ratingsAverage})",
                            style: theme.textTheme.labelMedium!
                                .copyWith(color: const Color(0xff06004F)),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          SvgPicture.asset("assets/icons/start.svg"),
                          const Expanded(
                            child: SizedBox(
                              width: 20,
                            ),
                          ),
                          BlocBuilder<Cart_FavoriteCubit, CartState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  if (widget.inCart == false) {
                                    Cart_FavoriteCubit.get(context).addToCart(
                                        productId: widget.data.id ?? '');
                                  } else {
                                    Cart_FavoriteCubit.get(context)
                                        .deleteItemOfCart(
                                            id: widget.data.id ?? '');
                                  }
                                  // ProductCubit.get(context)
                                  //     .addToCart(productId: widget.data.id ?? '');
                                },
                                child: CircleAvatar(
                                    radius: 13,
                                    backgroundColor: theme.primaryColor,
                                    child: Icon(
                                      widget.inCart ? Icons.remove : Icons.add,
                                      color: Colors.white,
                                    )),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          BlocBuilder<Cart_FavoriteCubit, CartState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  if (widget.isFavorite == true) {
                    Cart_FavoriteCubit.get(context)
                        .deleteFromFavorite(id: widget.data.id ?? '');
                  } else {
                    Cart_FavoriteCubit.get(context)
                        .addToFavorite(id: widget.data.id ?? '');
                  }
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: widget.isFavorite
                      ? SvgPicture.asset(
                          "assets/icons/Vector.svg",
                        )
                      : SvgPicture.asset(
                          "assets/icons/watchList_icon.svg",
                          color: theme.primaryColor,
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
