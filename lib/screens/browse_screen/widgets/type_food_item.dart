import 'package:flutter/material.dart';
import 'package:marketplace/utils/colors/app_colors.dart';
import 'package:marketplace/utils/extension/extension.dart';
import 'package:marketplace/utils/styles/app_style.dart';

class TypeFoodItem extends StatelessWidget {
  const TypeFoodItem(
      {super.key, required this.backgroundPhoto, required this.text});

  final String backgroundPhoto;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                backgroundPhoto,
                height: 64.screenHeight(),
                width: 98.screenWidth(),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                // SizedBox(height: 24.screenHeight()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 31.screenWidth(),vertical: 24.screenHeight()),
                  child: Text(
                    text,
                    style: AppStyle.sfProBold.copyWith(
                      fontSize: 14.textSize(),
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(width: 10.screenWidth())
      ],
    );
  }
}
