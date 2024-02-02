import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    this.onTap,
    this.borderRadius,
    this.textColor,
    required this.text,
  });
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: borderRadius,
      child: InkWell(
        splashColor: Colors.purple,
        borderRadius: borderRadius,
        onTap: onTap,
        child: SizedBox(
          height: 48,
          child: Center(
            child: Text(
              text,
              style: Styles.textStyle18.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
