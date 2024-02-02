import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.icon,
    this.widget,
    this.onPresssed,
  });
  final Widget? widget;
  final IconData? icon;
  final void Function()? onPresssed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30, right: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget!,
          IconButton(
            onPressed: onPresssed,
            icon: Icon(icon),
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
