import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key,
        required this.selectedIndex,
        required this.onTapFunction,
        required this.context});

  final int selectedIndex;
  final Function(int) onTapFunction;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);


    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25), topLeft: Radius.circular(25)),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 1,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: onTapFunction,
          items: [
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 20,
                backgroundColor:
                selectedIndex == 0 ? Colors.white : Colors.transparent,
                child: SvgPicture.asset(

                  "assets/icons/home_icon.svg",
                  fit: BoxFit.cover,
                  color: selectedIndex == 0 ? theme.primaryColor : Colors.white,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor:
                  selectedIndex == 1 ? Colors.white : Colors.transparent,
                  child: SvgPicture.asset(

                    "assets/icons/category_icon.svg",
                    fit: BoxFit.cover,
                    color: selectedIndex == 1 ? theme.primaryColor : Colors.white,
                  ),
                ),
                label: "Category"),
            BottomNavigationBarItem(
                icon:CircleAvatar(
                  radius: 20,
                  backgroundColor:
                  selectedIndex == 2 ? Colors.white : Colors.transparent,
                  child: SvgPicture.asset(

                    "assets/icons/watchList_icon.svg",
                    fit: BoxFit.cover,
                    color: selectedIndex == 2 ? theme.primaryColor : Colors.white,
                  ),
                ),
                label: "WatchList"),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor:
                  selectedIndex == 3 ? Colors.white : Colors.transparent,
                  child: SvgPicture.asset(

                    "assets/icons/account_icon.svg",
                    fit: BoxFit.cover,
                    color: selectedIndex == 3 ? theme.primaryColor : Colors.white,
                  ),
                ),
                label: "Account")
          ]),
    );
  }
}
