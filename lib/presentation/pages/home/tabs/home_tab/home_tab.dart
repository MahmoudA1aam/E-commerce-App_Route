import 'package:ecommerce/domain/use_case/home_tabe_use_case/get_all_brand_use_case.dart';
import 'package:ecommerce/presentation/cubit/home_layer/tabs/home_tab/home_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_search_text_field.dart';
import '../../../../../domain/use_case/home_tabe_use_case/get_allCategory_use_case.dart';
import '../../../../widgets/home_tabe/custom_categories_item.dart';
import '../../../../widgets/home_tabe/custom_item_announcement.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  HomeTabCubit homeTabCubit =
      HomeTabCubit(getAllCategoryUseCase: injectHomeTabUseCase(),getAllBrandUseCase: injectGetAllBrandUseCase());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<HomeTabCubit, HomeTabState>(
      bloc: homeTabCubit..getAllCategory()..getAllBrands(),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 17.w,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 17.w),
                  child: CustomSearchTextField(),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 17.w),
                  child: CustomItemAnnouncement(),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 17.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: Color(0xff06004F)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "view all",
                          style: theme.textTheme.labelMedium!
                              .copyWith(color: Color(0xff06004F)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                state is HomeTabCategoryLoadingState
                    ? CircularProgressIndicator()
                    : CustomCategoriesOrBrandItem(
                        list: homeTabCubit.listOfCategory,
                      ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 17.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Brands",
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: Color(0xff06004F)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "view all",
                          style: theme.textTheme.labelMedium!
                              .copyWith(color: Color(0xff06004F)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                state is HomeTabBrandLoadingState
                    ? CircularProgressIndicator()
                    : CustomCategoriesOrBrandItem(
                        list: homeTabCubit.listOfBrand,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
