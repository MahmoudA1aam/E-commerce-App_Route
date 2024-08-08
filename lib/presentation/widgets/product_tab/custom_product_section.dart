import 'package:ecommerce/core/cofig/page_route_name.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomProductSection extends StatelessWidget {
  const CustomProductSection({super.key, required this.list});

  final List<ProductDataEntity> list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 2 / 2.5),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRouteName.productDetails,
                    arguments: list[index]);
              },
              child: CustomProductItem(
                data: list[index],
              ),
            );
          }),
    );
  }
}

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key, required this.data});

  final ProductDataEntity data;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: const Alignment(0.9, -0.9),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.sp),
                    topRight: Radius.circular(15.sp)),
                child: Image.network(
                  data.imageCover ?? '',
                  height: 128.h,
                  width: 191.w,
                  fit: BoxFit.cover,
                ),
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  "assets/icons/watchList_icon.svg",
                  color: theme.primaryColor,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium!.copyWith(
                      fontSize: 14,
                      color: const Color(0xff06004F),
                    )),
                Text("EGP ${data.price}",
                    style: theme.textTheme.labelMedium!.copyWith(
                      fontSize: 14,
                      color: const Color(0xff06004F),
                    )),
                Row(
                  children: [
                    Text(
                      "Review (${data.ratingsAverage})",
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
                    CircleAvatar(
                        radius: 13,
                        backgroundColor: theme.primaryColor,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
