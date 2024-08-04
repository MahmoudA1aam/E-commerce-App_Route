import 'package:flutter/material.dart';
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
        SvgPicture.asset("assets/icons/🦆 icon _shopping_cart.svg")
      ],
    );
  }
}
