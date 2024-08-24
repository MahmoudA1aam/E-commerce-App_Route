import 'package:ecommerce/core/widgets/custom_search_text_field.dart';
import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/get_from_favorite.dart';

import 'package:ecommerce/presentation/cubit/home_layer/tabs/cart_view/cart_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late Cart_FavoriteCubit favoriteCubit;

  @override
  void initState() {
    favoriteCubit = Cart_FavoriteCubit.get(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<Cart_FavoriteCubit, CartState>(
      builder: (context, state) {
        if (favoriteCubit.favoriteList.isEmpty) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                children: [
                  const CustomSearchTextField(),
                  Expanded(
                    child: Center(
                      child: Text("No Product is Favorite",
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: theme.primaryColor)),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              children: [
                const CustomSearchTextField(),
                state is GetFromFavoriteSuccessState ||
                        state is DeleteFromFavoriteSuccessState
                    ? Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: favoriteCubit.favoriteList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: CustomFavoriteItem(
                                data: favoriteCubit.favoriteList[index],
                              ),
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: theme.primaryColor,
                          ),
                        ),
                      ),
              ],
            ));
      },
    );
  }
}

class CustomFavoriteItem extends StatelessWidget {
  const CustomFavoriteItem({super.key, required this.data});

  final GetDataFromFavoriteEntity data;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
        right: 8.w,
      ),
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
              data.imageCover ?? '',
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
                          data.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Cart_FavoriteCubit.get(context)
                                .deleteFromFavorite(id: data.id ?? '');
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              "assets/icons/Vector.svg",
                            ),
                          ))
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
                              MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  "Add to Cart",
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(fontSize: 14),
                                ),
                              )
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
