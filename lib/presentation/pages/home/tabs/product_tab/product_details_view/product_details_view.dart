import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({super.key, required this.args});

  final ProductDataEntity args;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int countProduct = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Product details"),
        centerTitle: true,
        titleTextStyle: theme.textTheme.bodyLarge!
            .copyWith(fontSize: 20, color: const Color(0xff06004F)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Color(0xff004182),
                size: 35.sp,
              )),
          const SizedBox(
            width: 5,
          ),
          SvgPicture.asset("assets/icons/🦆 icon _shopping_cart.svg"),
          SizedBox(
            width: 16.w,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: ImageSlideshow(
                  initialPage: 0,
                  height: 300.h,
                  indicatorColor: theme.primaryColor,
                  indicatorBackgroundColor: Colors.grey,
                  indicatorBottomPadding: 15.h,
                  indicatorRadius: 4,
                  disableUserScrolling: false,
                  isLoop: true,
                  children: widget.args.images!
                      .map(
                        (e) => ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: Image.network(
                            height: 300.h,
                            width: 398.w,
                            e,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                      .toList()),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250.w,
                  child: Text(
                    widget.args.title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: const Color(0xff06004F)),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "EGP ${widget.args.price}",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: const Color(0xff06004F)),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  height: 34.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(20.sp)),
                  child: Center(
                    child: Text(
                      "${widget.args.sold} Sold",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge!.copyWith(
                          color: const Color(0xff06004F), fontSize: 14),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/start.svg"),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "${widget.args.ratingsAverage} ",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff06004F), fontSize: 14),
                    ),
                    Text(
                      "(${widget.args.ratingsQuantity})",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff06004F), fontSize: 14),
                    ),
                  ],
                ),
                Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (countProduct > 0) {
                                countProduct--;
                              }

                              setState(() {});
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/icon_minis.svg",
                              color: Colors.white,
                            )),
                        Text(
                          "${countProduct}",
                          style: theme.textTheme.bodyLarge,
                        ),
                        IconButton(
                            onPressed: () {
                              countProduct++;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                              size: 27,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Text(
              "Description",
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: const Color(0xff06004F)),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ReadMoreText(
                  widget.args.description ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: "Poppins",
                      color: Color(0xff06004F).withOpacity(0.6)),
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  colorClickableText: Color(0xff06004F),
                  trimCollapsedText: 'Read More ',
                  trimExpandedText: 'Read Less',
                  moreStyle: theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14, color: Color(0xff06004F)),
                  lessStyle: theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14, color: Color(0xff06004F)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Total price",
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: Color(0xff06004F).withOpacity(0.7)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "EGP "
                      "${widget.args.price! * countProduct}",
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 48,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.shopping_cart_checkout_sharp,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add to cart",
                            textAlign: TextAlign.center,
                            style:
                                theme.textTheme.bodyLarge!.copyWith(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
