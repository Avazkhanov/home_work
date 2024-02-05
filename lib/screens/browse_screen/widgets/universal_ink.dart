import 'package:flutter/material.dart';
import 'package:marketplace/utils/extension/extension.dart';
import 'package:marketplace/utils/styles/app_style.dart';

class UniversalInk extends StatelessWidget {
  const UniversalInk(
      {super.key,
      required this.backgroundColor,
      required this.onTap,
      required this.title,
      required this.textColor});

  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 25.screenHeight(),
      width: 70.screenWidth(),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: backgroundColor,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: AppStyle.sfProMedium.copyWith(
              fontSize: 13.textSize(),
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
