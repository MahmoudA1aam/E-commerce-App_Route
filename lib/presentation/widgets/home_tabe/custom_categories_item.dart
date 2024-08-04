import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entitiy/tabs/home_tab_entity/CategoryOrBrandEntityModel.dart';

class CustomCategoriesOrBrandItem extends StatelessWidget {
  const CustomCategoriesOrBrandItem({super.key, required this.list});

  final List<DataOfCategoryOrBrandEntity>? list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Expanded(
        child: GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 9 / 7),
          itemCount: list!.length,
          itemBuilder: (context, index) {
            return CustomItemListCategoryOrBrand(dataEntity: list![index]);
          },
        ),
      ),
    );
  }
}

class CustomItemListCategoryOrBrand extends StatelessWidget {
  const CustomItemListCategoryOrBrand({super.key, required this.dataEntity});

  final DataOfCategoryOrBrandEntity dataEntity;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            dataEntity.image ?? '',
          ),
        ),
        Text(
            textAlign: TextAlign.center,
            dataEntity.name ??
                ''.replaceAll(
                  ' ',
                  '\n',
                ),
            maxLines: 3,
            style: theme.textTheme.bodyMedium!.copyWith(
                color: Color(
                  0xff06004F,
                ),
                fontSize: 14))
      ],
    );
  }
}
