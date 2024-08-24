import 'package:ecommerce/core/cofig/page_route_name.dart';
import 'package:ecommerce/presentation/cubit/home_layer/tabs/cart_view/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              prefixIcon: Icon(
                Icons.search_outlined,
                color: theme.primaryColor,
                size: 40.sp,
              ),
              hintText: " what do you search for?",
              hintStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  color: Color(0xff06004F)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        BlocBuilder<Cart_FavoriteCubit, CartState>(
          builder: (context, state) {
            return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PageRouteName.cartView);
                },
                child: Badge(
                    label:
                        Text(Cart_FavoriteCubit.get(context).numOfCartItem.toString()),
                    child: SvgPicture.asset(
                        "assets/icons/🦆 icon _shopping_cart.svg")));
          },
        )
      ],
    );
  }
}
