import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketplace/utils/extension/extension.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_style.dart';

class FoodInk extends StatelessWidget {
  const FoodInk(
      {super.key,
      this.type,
      required this.productName,
      required this.photoPath,
      required this.grade,
      required this.minutes,
      required this.width,
      required this.height,
      this.typeColor,
      required this.photoHeight,
      required this.photoWidth});

  final String? type;
  final String productName;
  final String photoPath;
  final String grade;
  final String minutes;
  final int width;
  final int height;
  final int photoHeight;
  final int photoWidth;
  final Color? typeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Ink(
          width: width.screenWidth(),
          height: height.screenHeight(),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  color: AppColors.black.withOpacity(.5))
            ],
            color: AppColors.white,
          ),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.asset(
                        photoPath,
                        height: photoHeight.screenHeight(),
                        width: photoWidth.screenWidth(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.screenHeight()),
                        Row(
                          children: [
                            typeColor != null
                                ? Container(
                                    padding: EdgeInsets.all(4),
                                    height: 22.screenHeight(),
                                    decoration: ShapeDecoration(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                      ),
                                      color: typeColor,
                                    ),
                                    child: type != null
                                        ? Text(
                                            type!,
                                            textAlign: TextAlign.center,
                                            style: AppStyle.sfProBold.copyWith(
                                              color: AppColors.white,
                                              fontSize: 12.textSize(),
                                            ),
                                          )
                                        : null,
                                  )
                                : SizedBox(),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.all(4),
                              height: 18.screenHeight(),
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  color: AppColors.white),
                              child: Text(
                                "\$\$",
                                style: AppStyle.sfProBold.copyWith(
                                  color: AppColors.c_333333,
                                  fontSize: 10.textSize(),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.screenWidth()),
                          ],
                        ),
                        SizedBox(height: 81.screenHeight()),
                        Row(
                          children: [
                            const Spacer(),
                            Container(
                              height: 44.screenHeight(),
                              width: 44.screenWidth(),
                              decoration: ShapeDecoration(
                                  shape: OvalBorder(),
                                  color: AppColors.c_4C95FF),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    minutes,
                                    style: AppStyle.sfProSemiBold.copyWith(
                                        color: AppColors.white,
                                        fontSize: 12.textSize()),
                                  ),
                                  Text(
                                    "min",
                                    style: AppStyle.sfProSemiBold.copyWith(
                                        color: AppColors.white.withOpacity(.8),
                                        fontSize: 10.textSize()),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 12.screenWidth()),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.screenWidth()),
                          child: Text(
                            productName,
                            style: AppStyle.sfProBold.copyWith(
                                color: AppColors.c_333333,
                                fontSize: 16.textSize()),
                          ),
                        ),
                        SizedBox(height: 8.screenHeight()),
                        Row(
                          children: [
                            SizedBox(width: 12.screenWidth()),
                            SvgPicture.asset(AppImages.starIcon),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "$grade ",
                                  style: AppStyle.sfProMedium
                                      .copyWith(fontSize: 13.textSize())),
                              const TextSpan(
                                  text: '(99+)  | Western  |  50m',
                                  style: AppStyle.sfProRegular),
                            ]))
                          ],
                        ),
                        SizedBox(height: 12.screenHeight()),
                        Row(
                          children: [
                            SizedBox(width: 12.screenWidth()),
                            Ink(
                              height: 24.screenHeight(),
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  color: AppColors.c_4C95FF.withOpacity(.1)),
                              child: InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(4),
                                  child: Row(
                                    children: [
                                      Text("Quick \$100+ ",
                                          style: AppStyle.sfProSemiBold),
                                      SizedBox(width: 4.screenWidth()),
                                      SvgPicture.asset(
                                          AppImages.quickDeliveryIcon)
                                    ],
                                  )),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16.screenWidth())
      ],
    );
  }
}
