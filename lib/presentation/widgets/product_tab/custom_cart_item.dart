import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entitiy/tabs/product_tab_entity/Get_Response_from_Cart_Entity.dart';
import '../../cubit/home_layer/tabs/cart_view/cart_cubit.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({super.key, required this.data});

  final GetProductsResponseCartEntity data;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(right: 8.w, ),
      // mediaQuery.height * 0.1244635193133,
      height: 113.h,
      width: mediaQuery.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              fit: BoxFit.cover,
              data.product?.imageCover ?? '',
              height: 113.h,
              width: 120.w,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          data.product?.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Cart_FavoriteCubit.get(context).deleteItemOfCart(
                                id: data.product?.id.toString() ?? '');
                          },
                          child:
                          SvgPicture.asset("assets/icons/icon_delete.svg"))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${data.price}",
                        style: theme.textTheme.labelLarge,
                      ),
                      Container(
                        height: 42.h,
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Cart_FavoriteCubit.get(context).updateMinisCount(
                                        id: data.product?.id ?? '',
                                        count: data.count ?? 0);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/icons/icon_minis.svg",
                                    color: Colors.white,
                                  )),
                              Text(
                                data.count.toString(),
                                style: theme.textTheme.bodyLarge,
                              ),
                              IconButton(
                                  onPressed: () {
                                    Cart_FavoriteCubit.get(context).updatePlusCount(
                                        id: data.product?.id ?? '',
                                        count: data.count ?? 0);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/icons/🦆 icon _plus circle.svg",
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}